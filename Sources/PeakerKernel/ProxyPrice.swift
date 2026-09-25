import Foundation

public enum ProxyPriceError: Error, Equatable, CustomStringConvertible {
    case missingComponent
    case weightsMustSumToOne(String)
    case countMismatch

    public var description: String {
        switch self {
        case .missingComponent:
            return "A required proxy component is missing. Exact replay is blocked; weights are not renormalized."
        case .weightsMustSumToOne(let sum):
            return "Proxy weights must sum to exactly 1. They sum to \(sum)."
        case .countMismatch:
            return "Proxy weight count and price count differ."
        }
    }
}

/// Area price proxy (§6.2): proxy_price(t) = Σ weight_i × source_price_i(t). Weights sum to one.
public enum ProxyPrice {
    public static let defaultAreaWeights: [Decimal] = [
        Decimal(string: "0.50")!,
        Decimal(string: "0.30")!,
        Decimal(string: "0.20")!,
    ]

    public static func combine(weights: [Decimal], prices: [Decimal?]) throws -> Decimal {
        guard weights.count == prices.count else { throw ProxyPriceError.countMismatch }
        guard !weights.isEmpty else { throw ProxyPriceError.missingComponent }
        var pairs: [(Decimal, Decimal)] = []
        pairs.reserveCapacity(weights.count)
        for (weight, price) in zip(weights, prices) {
            guard let price else { throw ProxyPriceError.missingComponent }
            pairs.append((weight, price))
        }
        let sum = pairs.reduce(Decimal(0)) { $0 + $1.0 }
        guard sum == 1 else { throw ProxyPriceError.weightsMustSumToOne(String(describing: sum)) }
        return pairs.reduce(Decimal(0)) { $0 + ($1.0 * $1.1) }
    }
}
