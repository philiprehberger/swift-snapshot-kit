import Foundation

/// Manages reference and failure snapshot images on disk
public struct SnapshotStorage: Sendable {
    private let referenceDirectory: String
    private let failureDirectory: String

    /// Create a snapshot storage manager
    public init(testFilePath: String) {
        let testDir = (testFilePath as NSString).deletingLastPathComponent
        self.referenceDirectory = testDir + "/__Snapshots__"
        self.failureDirectory = testDir + "/__Failures__"
    }

    /// Get the reference image path for a named snapshot
    public func referencePath(named name: String) -> String {
        "\(referenceDirectory)/\(name).png"
    }

    /// Get the failure image path for a named snapshot
    public func failurePath(named name: String) -> String {
        "\(failureDirectory)/\(name)_failure.png"
    }

    /// Get the diff image path for a named snapshot
    public func diffPath(named name: String) -> String {
        "\(failureDirectory)/\(name)_diff.png"
    }

    /// Check if a reference image exists
    public func referenceExists(named name: String) -> Bool {
        FileManager.default.fileExists(atPath: referencePath(named: name))
    }

    /// Save image data to a path, creating directories as needed
    public func save(data: Data, to path: String) throws {
        let directory = (path as NSString).deletingLastPathComponent
        try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        try data.write(to: URL(fileURLWithPath: path))
    }

    /// Load image data from a path
    public func load(from path: String) throws -> Data {
        try Data(contentsOf: URL(fileURLWithPath: path))
    }
}
