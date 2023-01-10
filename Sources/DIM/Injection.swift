import Foundation

/// Injection is a struct that stores the name of a dependency and a closure that resolves it
public struct Injection {
    let name: String
    let resolve: () -> Any

    /// Initializes an Injection for a specific type with a closure that resolves it
    public init<T>(_ name: T.Type, _ resolve: @escaping () -> T) {
        self.name = String(describing: name)
        self.resolve = resolve
    }

    /// Initializes an Injection with a specific name and a closure that resolves it
    public init(_ name: String, _ resolve: @escaping () -> Any) {
        self.name = name
        self.resolve = resolve
    }
}
