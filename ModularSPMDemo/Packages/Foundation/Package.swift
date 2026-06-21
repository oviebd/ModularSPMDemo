// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FoundationKit",
    products: [
        .library(
            name: "FoundationKit",
            targets: ["FoundationKit"]
        )
    ],
    targets: [
        .target(
            name: "FoundationKit",
            path: "Sources/FoundationKit"
        )
    ]
)
