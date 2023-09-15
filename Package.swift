// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdmiralCheckControlSwiftUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdmiralCheckControlSwiftUI",
            targets: ["AdmiralCheckControlSwiftUI"]),
    ],
    dependencies: [
        .package(url: "git@github.com:admiral-team/AdmiralCore.git", .exact("0.0.1")),
        .package(url: "git@github.com:admiral-team/AdmiralTheme.git", .exact("0.0.1")),
    ],
    targets: [
        .target(
            name: "AdmiralCheckControlSwiftUI",
            dependencies: [
                .product(name: "AdmiralCore", package: "AdmiralCore"),
                .product(name: "AdmiralTheme", package: "AdmiralTheme")
            ],
            path: "Sources/CheckControl/",
            resources: [.process("Resources")]
        )
    ]
)


