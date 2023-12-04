// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AdventOfCode2023",
  platforms: [
    .macOS(.v14)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .executable(
      name: "Day1",
      targets: ["Day1"]
    ),
    .executable(
      name: "Day2",
      targets: ["Day2"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "Day1",
      resources: [
        .copy("input.txt")
      ]
    ),
    .executableTarget(
      name: "Day2",
      dependencies: [
        .product(name: "Parsing", package: "swift-parsing")
      ],
      resources: [
        .copy("input.txt")
      ]
    ),
    .testTarget(
      name: "Day2Tests",
      dependencies: ["Day2"]
    )
  ]
)
