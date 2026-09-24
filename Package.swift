// swift-tools-version: 6.0
// Phase 0 libraries are pure Swift so `swift test` can run on Linux.
// The iPhone app target lives in App/ and is opened with Xcode; it is not a SwiftPM product.
import PackageDescription

let package = Package(
    name: "PeakerTycoonTexas",
    products: [
        .library(name: "PeakerKernel", targets: ["PeakerKernel"]),
        .library(name: "PeakerData", targets: ["PeakerData"]),
    ],
    targets: [
        .target(
            name: "PeakerKernel",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "PeakerData",
            dependencies: ["PeakerKernel"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .testTarget(
            name: "PeakerKernelTests",
            dependencies: ["PeakerKernel"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .testTarget(
            name: "PeakerDataTests",
            dependencies: ["PeakerData"],
            exclude: ["Fixtures"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .testTarget(
            name: "PeakerGateTests",
            dependencies: ["PeakerData"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
    ]
)
