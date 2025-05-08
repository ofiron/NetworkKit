// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]),
    ],
    dependencies: [
        // Local path for development
//        .package(path: "../FoundationCoreKit"),
        // Version
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", exact: "0.0.2"),
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", from: "0.0.3"),
        .package(url: "https://github.com/ofiron/FoundationCoreKit", .upToNextMinor(from: "0.0.3")),
        // dev branch
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", branch: "dev"),
//        .package(url: "https://github.com/ofiron/FoundationCoreKit", branch: "additions"),

        // Externals
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.10.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkKit",
            dependencies: [
                "FoundationCoreKit",
                "Alamofire"]),
        .testTarget(
            name: "NetworkKitTests",
            dependencies: ["NetworkKit"]
        ),
    ]
)
