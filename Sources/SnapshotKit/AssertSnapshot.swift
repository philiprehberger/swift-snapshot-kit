import Foundation

/// Assert that a snapshot matches its reference, or record a new reference
///
/// This is the cross-platform entry point. On platforms without SwiftUI rendering,
/// it provides the configuration and storage infrastructure.
///
/// - Parameters:
///   - imageData: Pre-rendered image data to compare
///   - config: Snapshot configuration
///   - named: Optional name for the snapshot file
///   - record: Set to true to save as new reference
///   - file: The test file path (auto-captured)
///   - function: The test function name (auto-captured)
public func assertSnapshot(
    imageData: Data,
    as config: SnapshotConfig = .default,
    named name: String? = nil,
    record: Bool = false,
    file: StaticString = #filePath,
    function: StaticString = #function
) throws {
    let storage = SnapshotStorage(testFilePath: "\(file)")
    let snapshotName = name ?? "\(function)".replacingOccurrences(of: "()", with: "")

    if record {
        try storage.save(data: imageData, to: storage.referencePath(named: snapshotName))
        return
    }

    guard storage.referenceExists(named: snapshotName) else {
        throw SnapshotError.referenceNotFound(path: storage.referencePath(named: snapshotName))
    }

    let referenceData = try storage.load(from: storage.referencePath(named: snapshotName))
    let difference = ImageComparator.compare(referenceData, imageData)

    if difference > config.tolerance {
        try storage.save(data: imageData, to: storage.failurePath(named: snapshotName))
        throw SnapshotError.mismatch(
            difference: difference,
            referencePath: storage.referencePath(named: snapshotName),
            failurePath: storage.failurePath(named: snapshotName),
            diffPath: storage.diffPath(named: snapshotName)
        )
    }
}
