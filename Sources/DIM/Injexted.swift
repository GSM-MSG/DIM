import Foundation

@propertyWrapper
public final class Injected<T> {
    public let wrappedValue: T

    public init(){
        wrappedValue = DIMContainer.resolve()
    }
}
