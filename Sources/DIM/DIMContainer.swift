import Foundation

/// DIMContainer is a class that stores dependencies and allows you to resolve them by name
public final class DIMContainer {
    /// The root container is a singleton that is shared across the entire app
    private static let root = DIMContainer()
    /// A dictionary that maps injection names to Injection objects
    internal private(set) var injected: [String: Injection] = [:]

    /// Initializes an empty container
    public init() {}

    /// Initializes a container with an array of Injections
    public init(@InjectionBuilder _ injections: () -> [Injection]) {
        injections().forEach { register(injection: $0) }
    }

    /// Clears the dependencies from the container when it is deinitialized
    deinit { injected.removeAll() }

    /// Returns an instance of type T from the root container, based on the optional name parameter
    public static func resolve<T>(for name: String? = nil) -> T {
        let name = name ?? String(describing: T.self)
        guard let resolved = DIMContainer.root.injected[name]?.resolve() as? T else {
            fatalError("\(name) not registered")
        }
        return resolved
    }

    /// Returns an instance of type T from the root container, based on the optional Type parameter
    public static func resolve<T>(for type: T.Type) -> T {
        let name = String(describing: T.self)
        guard let resolved = DIMContainer.root.injected[name]?.resolve() as? T else {
            fatalError("\(name) not registered")
        }
        return resolved
    }

    /// Registers an Injection object in the container
    public func register(injection: Injection) {
        injected[injection.name] = injection
    }

    /// Sets the injected dictionary of the root container to the current container's injected dictionary
    public func build() {
        DIMContainer.root.injected = self.injected
    }
}
