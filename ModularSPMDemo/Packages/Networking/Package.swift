// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Networking",
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        )
    ],
    dependencies: [
        .package(path: "../Foundation")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: [
                .product(name: "FoundationKit", package: "Foundation")
            ],
            path: "Sources/Networking"
        )
    ]
)
