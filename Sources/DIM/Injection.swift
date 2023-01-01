import Foundation

public struct Injection {
    let name: String
    let resolve: () -> Any

    public init<T>(_ name: T.Type, _ resolve: @escaping () -> T) {
        self.name = String(describing: name)
        self.resolve = resolve
    }

    public init(_ name: String, _ resolve: @escaping () -> Any) {
        self.name = name
        self.resolve = resolve
    }
}
