// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OpenDoorNFC",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "OpenDoorNFC", targets: ["OpenDoorNFC"])
    ],
    targets: [
        .target(
            name: "OpenDoorNFC",
            path: "Sources/OpenDoorNFC"
        ),
        .testTarget(
            name: "OpenDoorNFCTests",
            dependencies: ["OpenDoorNFC"],
            path: "Tests/OpenDoorNFCTests"
        )
    ]
)