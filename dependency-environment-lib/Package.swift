// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "dependency-environment-lib",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DependencyEnvironmentMacros",
            targets: ["DependencyEnvironmentMacros"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformations.
        .macro(
            name: "DependencyEnvironmentMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        // Library that exposes a macro as part of its API.
        .target(name: "DependencyEnvironment",
                dependencies: ["DependencyEnvironmentMacros"]),
        .testTarget(
            name: "DependencyEnvironmentMacrosTests",
            dependencies: ["DependencyEnvironmentMacros"]
        ),
    ]
)
