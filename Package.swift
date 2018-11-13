// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Raptor",
    products: [
        .library(name: "Raptor", targets: ["Raptor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueSocket.git", from: "1.0.24")
    ],
    targets: [.target(name: "Raptor", dependencies: [
        "Socket"
    ], path: "Raptor/Sources")],
    swiftLanguageVersions: [4]
)
