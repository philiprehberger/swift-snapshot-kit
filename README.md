# SnapshotKit

[![Tests](https://github.com/philiprehberger/swift-snapshot-kit/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/swift-snapshot-kit/actions/workflows/ci.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fphiliprehberger%2Fswift-snapshot-kit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/philiprehberger/swift-snapshot-kit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fphiliprehberger%2Fswift-snapshot-kit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/philiprehberger/swift-snapshot-kit)

Snapshot testing for SwiftUI with visual diffs, multi-device support, and dark mode comparison

## Requirements

- Swift >= 6.0
- macOS 13+ / iOS 16+ / tvOS 16+ / watchOS 9+

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/philiprehberger/swift-snapshot-kit.git", from: "0.1.0")
]
```

Then add `"SnapshotKit"` to your **test** target dependencies:

```swift
.testTarget(name: "YourTests", dependencies: [
    .product(name: "SnapshotKit", package: "swift-snapshot-kit")
])
```

## Usage

```swift
import SnapshotKit

// Basic snapshot test
try assertSnapshot(of: MyView())

// Record mode (first run or to update references)
try assertSnapshot(of: MyView(), record: true)
```

### Custom Configuration

```swift
try assertSnapshot(
    of: MyView(),
    as: SnapshotConfig(
        size: DevicePreset.iPhone15Pro.size,
        traits: SnapshotTraits(colorScheme: .dark),
        tolerance: 0.01
    )
)
```

### Multi-Device Testing

```swift
for device in [DevicePreset.iPhoneSE, .iPhone15, .iPadPro11] {
    try assertSnapshot(
        of: MyView(),
        as: SnapshotConfig(size: device.size),
        named: device.name
    )
}
```

### Dark Mode Comparison

```swift
try assertSnapshot(
    of: MyView(),
    as: SnapshotConfig(traits: SnapshotTraits(colorScheme: .dark)),
    named: "dark"
)
```

### Dynamic Type

```swift
try assertSnapshot(
    of: MyView(),
    as: SnapshotConfig(traits: SnapshotTraits(dynamicTypeSize: .xxxLarge)),
    named: "large-text"
)
```

## API

### assertSnapshot

| Parameter | Description |
|-----------|-------------|
| `of` | The SwiftUI view to snapshot |
| `as` | Snapshot configuration (size, traits, tolerance) |
| `named` | Optional name for the snapshot file |
| `record` | Set to `true` to record new reference images |
| `timeout` | Maximum time to wait for rendering |

### SnapshotConfig

| Property | Description |
|----------|-------------|
| `size` | The rendering size |
| `traits` | Color scheme and dynamic type size |
| `tolerance` | Acceptable difference (0.0-1.0) |

### DevicePreset

| Preset | Size |
|--------|------|
| `iPhone15` | 393 x 852 |
| `iPhone15Pro` | 393 x 852 |
| `iPhone15ProMax` | 430 x 932 |
| `iPhoneSE` | 375 x 667 |
| `iPadPro11` | 834 x 1194 |
| `iPadPro13` | 1024 x 1366 |

## Development

```bash
swift build
swift test
```

## Support

[Bluesky](https://bsky.app/profile/philiprehberger.bsky.social) · [X](https://x.com/philiprehberger) · [LinkedIn](https://linkedin.com/in/philiprehberger) · [Website](https://philiprehberger.com) · [GitHub](https://github.com/philiprehberger) · [Buy Me a Coffee](https://buymeacoffee.com/philiprehberger) · [GitHub Sponsors](https://github.com/sponsors/philiprehberger)

## License

[MIT](LICENSE)
