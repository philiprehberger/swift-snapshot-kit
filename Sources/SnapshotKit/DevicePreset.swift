import Foundation

/// Predefined device screen sizes for snapshot testing
public enum DevicePreset: String, Sendable, CaseIterable {
    case iPhone15
    case iPhone15Pro
    case iPhone15ProMax
    case iPhoneSE
    case iPadPro11
    case iPadPro13

    /// The screen size in points
    public var size: (width: Double, height: Double) {
        switch self {
        case .iPhone15: return (393, 852)
        case .iPhone15Pro: return (393, 852)
        case .iPhone15ProMax: return (430, 932)
        case .iPhoneSE: return (375, 667)
        case .iPadPro11: return (834, 1194)
        case .iPadPro13: return (1024, 1366)
        }
    }

    /// Human-readable device name
    public var name: String { rawValue }
}
