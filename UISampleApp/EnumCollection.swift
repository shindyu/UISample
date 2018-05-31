public protocol EnumCollection: Hashable {
    static var cases: [Self] { get }
}

public extension EnumCollection {

    public static var cases: [Self] {
        let cases = AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
        return Array(cases)
    }

    public static var count: Int {
        return self.cases.count
    }
}
