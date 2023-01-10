import Foundation

/// InjectionBuilder is a result builder that allows you to build an array of Injections
/// using the @InjectionBuilder property wrapper
@resultBuilder
public struct InjectionBuilder {
    public static func buildBlock(_ components: Injection...) -> [Injection] { components }

    public static func buildBlock(_ components: Injection) -> [Injection] { [components] }
    
    public static func buildBlock(_ components: DIMContainer...) -> [Injection] {
        components.map(\.injected).reduce(into: [Injection]()) { partialResult, injected in
            partialResult += injected.values
        }
    }

    public static func buildEither(first component: Injection) -> Injection { component }

    public static func buildEither(second component: Injection) -> Injection { component }

    public static func buildLimitedAvailability(_ component: Injection) -> Injection { component }
}
