// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Login",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Login",
            targets: ["Login"]
        )
    ],
    dependencies: [
        .package(path: "../Foundation"),
        .package(path: "../Networking")
    ],
    targets: [
        .target(
            name: "Login",
            dependencies: [
                .product(name: "FoundationKit", package: "Foundation"),
                .product(name: "Networking", package: "Networking")
            ],
            path: "Sources/Login"
        )
    ]
)
