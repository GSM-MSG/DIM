import Foundation

@resultBuilder
struct InjectionBuilder {
    static func buildBlock(_ components: Injection...) -> [Injection] { components }

    static func buildBlock(_ components: [Injection]) -> [Injection] { components }

    static func buildBlock(_ components: Injection) -> Injection { components }

    static func buildEither(first component: Injection) -> Injection { component }

    static func buildEither(second component: Injection) -> Injection { component }

    static func buildLimitedAvailability(_ component: Injection) -> Injection { component }
}
