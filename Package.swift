// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DIM",
    platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v7), .macOS(.v12)],
    products: [
        .library(
            name: "DIM",
            targets: ["DIM"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DIM",
            dependencies: []
        ),
        .testTarget(
            name: "DIMTests",
            dependencies: ["DIM"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
