import Foundation
import PeakerZipInflate

/// Read path for retained NP4-190-CD and NP6-905-CD price zips.
///
/// Looks only in `batch2`, `batch3`, `batch4`, `batch5`, `batch6`, and `batch7` under the 2026-09-24 retain root.
/// Each zip must match its `.sha256` sidecar before the CSV member is parsed.
/// This does not fetch, does not publish, and does not write coverage. `sourcePublishedAt` stays null.
/// Proxy `source_point_id` and `covered_local_dates` are not filled.
///
/// Live `deliveryDateFrom`/`deliveryDateTo` for 2023-01-15 returned no rows on both products in an
/// earlier drop. Batch 6 has a day-ahead CSV whose DeliveryDate is that day. That file is a
/// retained sample, not a live From/To fill. Batch 7 live From/To is empty for 2023-10-15.
/// The day-ahead zip posted 2023-10-14 has DeliveryDate 2023-10-15. Two batch 7 NP6 zips have
/// DeliveryDate 2022-11-15 (hour 12, intervals 3 and 4). Those are archive samples. This drop did
/// not re-query the live endpoint for 2022-11-15. NP6 files are one interval.
/// NP4-180-ER and NP6-785-ER are not opened here and have no path.
public enum RetainedSettlementArchive {
    public static let batchFolderNames = ["batch2", "batch3", "batch4", "batch5", "batch6", "batch7"]
    public static let emptyLiveFromToDay = "2023-01-15"
    /// Uncompressed CSV members larger than this are refused.
    static let maxUncompressedBytes = 32 * 1024 * 1024

    public static func priceZipURLs(in retainRoot: URL) throws -> [URL] {
        let fm = FileManager.default
        var found: [URL] = []
        for name in batchFolderNames {
            let directory = retainRoot.appendingPathComponent(name, isDirectory: true)
            var isDirectory: ObjCBool = false
            guard fm.fileExists(atPath: directory.path, isDirectory: &isDirectory), isDirectory.boolValue else {
                continue
            }
            let items = try fm.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            found.append(contentsOf: items.filter { $0.pathExtension.lowercased() == "zip" })
        }
        return found.sorted { $0.path < $1.path }
    }

    public static func product(forZipFileName name: String) -> ERCOTSettlementProduct? {
        let folded = name.lowercased()
        if folded.contains("np4-190-cd") { return .dayAheadNP4190CD }
        if folded.contains("np6-905-cd") { return .realtimeNP6905CD }
        return nil
    }

    /// Verify the sidecar, inflate the single CSV member, and parse it.
    /// `revisionId` defaults to the zip file name (a file label, not a market revision).
    public static func readZip(
        at zipURL: URL,
        ingestedAt: String,
        revisionId: String? = nil
    ) throws -> RetainedSettlementRead {
        let zipBytes = try Data(contentsOf: zipURL)
        let verified = try verifySidecar(zipURL: zipURL, zipBytes: zipBytes)
        let name = zipURL.lastPathComponent
        guard let product = product(forZipFileName: name) else {
            throw RetainedArchiveError.unknownProduct(name: name)
        }
        let csv = try csvData(fromZip: zipBytes)
        let parsed = IngestionPipeline.parseRetainedSettlementCSV(
            csv: csv,
            product: product,
            ingestedAt: ingestedAt,
            revisionId: revisionId ?? name
        )
        return RetainedSettlementRead(
            zipFileName: name,
            product: product,
            verifiedSHA256: verified,
            result: parsed
        )
    }

    public static func csvData(fromZip zipBytes: Data) throws -> Data {
        let member = try ZipStore.firstCSVMember(in: zipBytes)
        switch member.method {
        case 0:
            return member.payload
        case 8:
            return try inflateRaw(member.payload, uncompressedSize: member.uncompressedSize, crc: member.crc32)
        default:
            throw RetainedArchiveError.unsupportedCompression(method: Int(member.method))
        }
    }

    static func verifySidecar(zipURL: URL, zipBytes: Data) throws -> String {
        let sidecarURL = URL(fileURLWithPath: zipURL.path + ".sha256")
        guard FileManager.default.fileExists(atPath: sidecarURL.path) else {
            throw RetainedArchiveError.sidecarMissing(name: zipURL.lastPathComponent)
        }
        let text = try String(contentsOf: sidecarURL, encoding: .utf8)
        guard let expected = text.split(whereSeparator: { $0 == " " || $0 == "\n" || $0 == "\r" || $0 == "\t" }).first else {
            throw RetainedArchiveError.sidecarMismatch(expected: "", actual: SHA256Digest.hex(zipBytes))
        }
        let actual = SHA256Digest.hex(zipBytes)
        let expectedHex = String(expected).lowercased()
        guard expectedHex == actual else {
            throw RetainedArchiveError.sidecarMismatch(expected: expectedHex, actual: actual)
        }
        return actual
    }

    private static func inflateRaw(_ payload: Data, uncompressedSize: Int, crc: UInt32) throws -> Data {
        guard uncompressedSize >= 0, uncompressedSize <= maxUncompressedBytes else {
            throw RetainedArchiveError.inflateFailed
        }
        var output = Data(count: uncompressedSize)
        let written: Int = try output.withUnsafeMutableBytes { dst in
            try payload.withUnsafeBytes { src in
                var count = 0
                let status = peaker_inflate_raw(
                    src.bindMemory(to: UInt8.self).baseAddress,
                    src.count,
                    dst.bindMemory(to: UInt8.self).baseAddress,
                    dst.count,
                    &count
                )
                guard status == 0 else { throw RetainedArchiveError.inflateFailed }
                return count
            }
        }
        guard written == uncompressedSize else { throw RetainedArchiveError.inflateFailed }
        let actualCRC = output.withUnsafeBytes { raw -> UInt32 in
            guard let base = raw.bindMemory(to: UInt8.self).baseAddress else { return 0 }
            return peaker_crc32(base, raw.count)
        }
        guard actualCRC == crc else { throw RetainedArchiveError.inflateFailed }
        return output
    }
}

public struct RetainedSettlementRead: Equatable, Sendable {
    public let zipFileName: String
    public let product: ERCOTSettlementProduct
    public let verifiedSHA256: String
    public let result: ERCOTSettlementParseResult

    public init(
        zipFileName: String,
        product: ERCOTSettlementProduct,
        verifiedSHA256: String,
        result: ERCOTSettlementParseResult
    ) {
        self.zipFileName = zipFileName
        self.product = product
        self.verifiedSHA256 = verifiedSHA256
        self.result = result
    }
}

public enum RetainedArchiveError: Error, Equatable, CustomStringConvertible {
    case notAZip
    case truncated
    case unsupportedCompression(method: Int)
    case missingCSVMember
    case multipleCSVMembers
    case inflateFailed
    case sidecarMissing(name: String)
    case sidecarMismatch(expected: String, actual: String)
    case unknownProduct(name: String)

    public var description: String {
        switch self {
        case .notAZip:
            return "Retained bytes are not a zip archive."
        case .truncated:
            return "Retained zip is truncated."
        case .unsupportedCompression(let method):
            return "Retained zip uses compression method \(method). Only stored and deflate CSV members are read."
        case .missingCSVMember:
            return "Retained zip has no CSV member."
        case .multipleCSVMembers:
            return "Retained zip has more than one CSV member."
        case .inflateFailed:
            return "Retained zip CSV member did not inflate."
        case .sidecarMissing(let name):
            return "Retained zip \(name) has no sha256 sidecar."
        case .sidecarMismatch(let expected, let actual):
            return "Retained zip sha256 \(actual) does not match sidecar \(expected)."
        case .unknownProduct(let name):
            return "Retained zip \(name) is not NP4-190-CD or NP6-905-CD."
        }
    }
}

struct ZipMember {
    let method: UInt16
    let crc32: UInt32
    let uncompressedSize: Int
    let payload: Data
}

enum ZipStore {
    static func firstCSVMember(in data: Data) throws -> ZipMember {
        guard let eocd = endOfCentralDirectory(in: data) else {
            throw RetainedArchiveError.notAZip
        }
        var offset = eocd.directoryOffset
        let end = eocd.directoryOffset + eocd.directorySize
        var csv: [(name: String, method: UInt16, crc: UInt32, comp: Int, uncomp: Int, local: Int)] = []
        while offset + 46 <= end && offset + 46 <= data.count {
            guard readU32(data, offset) == 0x02014b50 else { break }
            let method = readU16(data, offset + 10)
            let crc = readU32(data, offset + 16)
            let comp = readU32(data, offset + 20)
            let uncomp = readU32(data, offset + 24)
            let nameLen = Int(readU16(data, offset + 28))
            let extraLen = Int(readU16(data, offset + 30))
            let commentLen = Int(readU16(data, offset + 32))
            let local = Int(readU32(data, offset + 42))
            let nameStart = offset + 46
            guard nameStart + nameLen <= data.count else { throw RetainedArchiveError.truncated }
            let name = String(decoding: data[nameStart..<(nameStart + nameLen)], as: UTF8.self)
            if name.lowercased().hasSuffix(".csv") {
                guard comp != 0xffffffff, uncomp != 0xffffffff else { throw RetainedArchiveError.truncated }
                csv.append((name, method, crc, Int(comp), Int(uncomp), local))
            }
            offset = nameStart + nameLen + extraLen + commentLen
        }
        guard let member = csv.first else { throw RetainedArchiveError.missingCSVMember }
        guard csv.count == 1 else { throw RetainedArchiveError.multipleCSVMembers }
        guard member.local + 30 <= data.count else { throw RetainedArchiveError.truncated }
        let nameLen = Int(readU16(data, member.local + 26))
        let extraLen = Int(readU16(data, member.local + 28))
        let start = member.local + 30 + nameLen + extraLen
        let finish = start + member.comp
        guard start >= 0, finish <= data.count else { throw RetainedArchiveError.truncated }
        return ZipMember(
            method: member.method,
            crc32: member.crc,
            uncompressedSize: member.uncomp,
            payload: data.subdata(in: start..<finish)
        )
    }

    private static func endOfCentralDirectory(in data: Data) -> (directoryOffset: Int, directorySize: Int)? {
        let minimum = 22
        guard data.count >= minimum else { return nil }
        let lower = max(0, data.count - minimum - 65_535)
        var index = data.count - minimum
        while index >= lower {
            if readU32(data, index) == 0x06054b50 {
                let commentLen = Int(readU16(data, index + 20))
                if index + minimum + commentLen == data.count {
                    return (Int(readU32(data, index + 16)), Int(readU32(data, index + 12)))
                }
            }
            if index == 0 { break }
            index -= 1
        }
        return nil
    }

    private static func readU16(_ data: Data, _ offset: Int) -> UInt16 {
        guard offset + 2 <= data.count else { return 0 }
        return UInt16(data[offset]) | (UInt16(data[offset + 1]) << 8)
    }

    private static func readU32(_ data: Data, _ offset: Int) -> UInt32 {
        guard offset + 4 <= data.count else { return 0 }
        return UInt32(data[offset])
            | (UInt32(data[offset + 1]) << 8)
            | (UInt32(data[offset + 2]) << 16)
            | (UInt32(data[offset + 3]) << 24)
    }
}
