import Foundation

/// Errors thrown during snapshot testing
public enum SnapshotError: Error, Sendable, CustomStringConvertible {
    /// The snapshot does not match the reference image
    case mismatch(difference: Double, referencePath: String, failurePath: String, diffPath: String)

    /// No reference image found at the expected path
    case referenceNotFound(path: String)

    /// The view could not be rendered to an image
    case renderingFailed

    /// The reference and actual images have different dimensions
    case sizeMismatch(expectedWidth: Double, expectedHeight: Double, actualWidth: Double, actualHeight: Double)

    /// Snapshot testing is not supported on this platform
    case unsupportedPlatform

    public var description: String {
        switch self {
        case .mismatch(let diff, _, _, _):
            return "Snapshot mismatch: \(String(format: "%.2f%%", diff * 100)) difference"
        case .referenceNotFound(let path):
            return "Reference snapshot not found at: \(path)"
        case .renderingFailed:
            return "Failed to render view to image"
        case .sizeMismatch(let ew, let eh, let aw, let ah):
            return "Size mismatch: expected \(ew)x\(eh), got \(aw)x\(ah)"
        case .unsupportedPlatform:
            return "Snapshot testing is not supported on this platform"
        }
    }
}
