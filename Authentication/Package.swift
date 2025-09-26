// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Authentication",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Authentication",
            targets: ["Authentication", "Register"]
        ),
    ],
    targets: [
        .target(
            name: "Authentication"
        ),
        .target(
            name: "Register"
        ),
        .testTarget(
            name: "AuthenticationTests",
            dependencies: ["Authentication"]
        ),
        .testTarget(
            name: "RegisterTests",
            dependencies: ["Register"]
        ),
    ]
)
