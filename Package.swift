// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swift-snapshot-kit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "SnapshotKit", targets: ["SnapshotKit"])
    ],
    targets: [
        .target(
            name: "SnapshotKit",
            path: "Sources/SnapshotKit"
        ),
        .testTarget(
            name: "SnapshotKitTests",
            dependencies: ["SnapshotKit"],
            path: "Tests/SnapshotKitTests"
        )
    ]
)
