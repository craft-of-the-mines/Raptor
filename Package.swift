// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Raptor",
    products: [
        .library(name: "Raptor", targets: ["Raptor"]),
    ],
    dependencies: [],
    targets: [.target(name: "Raptor", dependencies: [])],
    swiftLanguageVersions: [4]
)
