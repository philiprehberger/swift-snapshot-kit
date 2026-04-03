import Foundation

/// Display traits for snapshot rendering
public struct SnapshotTraits: Sendable {
    /// The color scheme to use
    public let colorScheme: ColorSchemeOption

    /// The dynamic type size
    public let dynamicTypeOption: DynamicTypeOption

    /// Create snapshot traits
    public init(
        colorScheme: ColorSchemeOption = .light,
        dynamicTypeSize: DynamicTypeOption = .medium
    ) {
        self.colorScheme = colorScheme
        self.dynamicTypeOption = dynamicTypeSize
    }
}

/// Color scheme options for snapshot rendering
public enum ColorSchemeOption: String, Sendable {
    case light
    case dark
}

/// Dynamic type size options for snapshot rendering
public enum DynamicTypeOption: String, Sendable {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    case xxxLarge
}
