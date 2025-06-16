// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BgmKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BgmKit",
            targets: ["BgmKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "2.2.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BgmKit",
            dependencies: [
                .product(name: "Get", package: "Get")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "BgmKitTests",
            dependencies: ["BgmKit"]
        ),
    ],
)
