// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Register",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Register",
            targets: ["Register"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Register"),
        .testTarget(
            name: "RegisterTests",
            dependencies: ["Register"]
        ),
    ]
)
