import Foundation

/// Configuration for snapshot rendering and comparison
public struct SnapshotConfig: Sendable {
    /// The rendering size in points
    public let width: Double

    /// The rendering height in points
    public let height: Double

    /// Display traits (color scheme, dynamic type)
    public let traits: SnapshotTraits

    /// Acceptable pixel difference ratio (0.0 = exact match, 1.0 = any difference)
    public let tolerance: Double

    /// Default configuration using iPhone 15 size
    public static let `default` = SnapshotConfig(
        width: DevicePreset.iPhone15.size.width,
        height: DevicePreset.iPhone15.size.height,
        traits: SnapshotTraits(),
        tolerance: 0.0
    )

    /// Create a snapshot configuration
    public init(
        width: Double,
        height: Double,
        traits: SnapshotTraits = SnapshotTraits(),
        tolerance: Double = 0.0
    ) {
        self.width = width
        self.height = height
        self.traits = traits
        self.tolerance = tolerance
    }

    /// Create a configuration from a device preset
    public init(
        size: (width: Double, height: Double),
        traits: SnapshotTraits = SnapshotTraits(),
        tolerance: Double = 0.0
    ) {
        self.width = size.width
        self.height = size.height
        self.traits = traits
        self.tolerance = tolerance
    }
}
