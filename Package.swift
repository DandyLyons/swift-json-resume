// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyJSONResume",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "SwiftyJSONResume",
            targets: ["SwiftyJSONResume"]),
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", from: "1.2.2"),
      .package(url: "https://github.com/kylef/JSONSchema.swift.git", from: "0.6.0"),
    ],
    targets: [
        .target(
            name: "SwiftyJSONResume",
            dependencies: [
              .product(name: "CustomDump", package: "swift-custom-dump"),
              .product(name: "JSONSchema", package: "jsonschema.swift"),
            ],
            resources: [
              .copy("Resources/JSONResume"),
            ]
        ),
        .testTarget(
            name: "SwiftyJSONResumeTests",
            dependencies: [
              "SwiftyJSONResume",
              
              .product(name: "CustomDump", package: "swift-custom-dump"),
              .product(name: "JSONSchema", package: "jsonschema.swift"),
            ]),
    ]
)
