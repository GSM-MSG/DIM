import Foundation

/// Injected is a property wrapper that initializes a wrapped value of type T with an instance returned by DIMContainer.resolve()
@propertyWrapper
public final class Injected<T> {
    /// The wrapped value, initialized with an instance returned by DIMContainer.resolve()
    public let wrappedValue: T

    public init(){
        wrappedValue = DIMContainer.resolve()
    }
}
