// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationPlus",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FoundationPlus",
            targets: ["FoundationPlus"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FoundationPlus"),
        .testTarget(
            name: "FoundationPlusTests",
            dependencies: ["FoundationPlus"]
        ),
    ]
)

let swiftSettings: [SwiftSetting] = [
	.enableUpcomingFeature("BareSlashRegexLiterals"),
	.enableUpcomingFeature("StrictConcurrency")
]

for target in package.targets {
	target.swiftSettings = target.swiftSettings ?? []
	target.swiftSettings?.append(contentsOf: swiftSettings)
}

