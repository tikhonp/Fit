// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Fit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Fit",
            targets: ["Fit"]
        ),
    ],
    targets: [
        .target(
            name: "Fit"
        ),
        .testTarget(
            name: "FitTests",
            dependencies: ["Fit"]
        ),
    ]
)
