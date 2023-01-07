import Foundation

@resultBuilder
struct DIMContainerBuilder {
    static func buildBlock(_ components: DIMContainer...) -> [DIMContainer] { components }

    static func buildBlock(_ components: [DIMContainer]) -> [DIMContainer] { components }

    static func buildBlock(_ components: DIMContainer) -> DIMContainer { components }

    static func buildEither(first component: DIMContainer) -> DIMContainer { component }

    static func buildEither(second component: DIMContainer) -> DIMContainer { component }

    static func buildLimitedAvailability(_ component: DIMContainer) -> DIMContainer { component }
}
