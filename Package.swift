// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-json-resume",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swift-json-resume",
            targets: ["SwiftyJSONResume"]),
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftyJSONResume"),
        .testTarget(
            name: "SwiftyJSONResumeTests",
            dependencies: [
              "SwiftyJSONResume",
              
              .product(name: "CustomDump", package: "swift-custom-dump")
            ]),
    ]
)
