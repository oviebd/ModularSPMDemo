// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Chat",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Chat",
            targets: ["Chat"]
        )
    ],
    dependencies: [
        .package(path: "../Foundation"),
        .package(path: "../Networking")
        // Notice: Chat does NOT import Login
        // That boundary is enforced right here
    ],
    targets: [
        .target(
            name: "Chat",
            dependencies: [
                .product(name: "FoundationKit", package: "Foundation"),
                .product(name: "Networking", package: "Networking")
            ],
            path: "Sources/Chat"
        )
    ]
)
