
public func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
        guard !ranges.isEmpty else { return 0..<0 }
        let low = ranges.lazy.map { $0.lowerBound }.min()!
        let high = ranges.lazy.map { $0.upperBound }.max()!
        return low..<high
}

public func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}
