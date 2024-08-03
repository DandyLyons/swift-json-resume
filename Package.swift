// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyJSONResume",
    products: [
        .library(
            name: "SwiftyJSONResume",
            targets: ["SwiftyJSONResume"]),
    ],
    dependencies: [
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", branch: "main"),
      .package(url: "https://github.com/kylef/JSONSchema.swift.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "SwiftyJSONResume",
            resources: [
              .process("Resources/JavaScript/node_modules/@jsonresume/schema"),
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
//
