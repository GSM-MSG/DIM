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

    public init(@DIMContainerBuilder _ container: () -> DIMContainer) {
        container().injected.forEach {
            register(injection: $0.value)
        }
    }

    public init (@DIMContainerBuilder _ containers: () -> [DIMContainer]) {
        containers().forEach {
            $0.injected.forEach {
                register(injection: $0.value)
            }
        }
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
