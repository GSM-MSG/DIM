import Foundation

public final class DIMContainer {
    private static let root = DIMContainer()
    private var injected: [String: Injection] = [:]

    public init() {}

    public init(@InjectionBuilder _ injections: () -> [Injection]) {
        injections().forEach { register(injection: $0) }
    }

    public init(@InjectionBuilder _ injection: () -> Injection) {
        register(injection: injection())
    }

    deinit { injected.removeAll() }

    static func resolve<T>(for name: String? = nil) -> T {
        let name = name ?? String(describing: T.self)
        guard let resolved = DIMContainer.root.injected[name] as? T else {
            fatalError("\(name) not registered")
        }
        return resolved
    }

    public func register(injection: Injection) {
        injected[injection.name] = injection
    }

    public func build() {
        DIMContainer.root.injected = self.injected
    }
}
