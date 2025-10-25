// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDSA",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftDSA",
            targets: ["SwiftDSA"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftDSA",
            path: "Sources",
            exclude: ["DataStructures/Queue/README.md"],
            sources: ["DataStructures"]
        ),
        .testTarget(
            name: "SwiftDSATests",
            dependencies: ["SwiftDSA"]
        ),
    ]
)
