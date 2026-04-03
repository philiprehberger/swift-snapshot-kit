import Testing
import Foundation
@testable import SnapshotKit

@Suite("SnapshotStorage Tests")
struct SnapshotStorageTests {
    @Test("Reference path includes __Snapshots__ directory")
    func referencePath() {
        let storage = SnapshotStorage(testFilePath: "/tests/MyTests.swift")
        let path = storage.referencePath(named: "test")
        #expect(path.contains("__Snapshots__"))
        #expect(path.hasSuffix("test.png"))
    }

    @Test("Failure path includes __Failures__ directory")
    func failurePath() {
        let storage = SnapshotStorage(testFilePath: "/tests/MyTests.swift")
        let path = storage.failurePath(named: "test")
        #expect(path.contains("__Failures__"))
        #expect(path.hasSuffix("test_failure.png"))
    }

    @Test("Diff path includes __Failures__ directory")
    func diffPath() {
        let storage = SnapshotStorage(testFilePath: "/tests/MyTests.swift")
        let path = storage.diffPath(named: "test")
        #expect(path.contains("__Failures__"))
        #expect(path.hasSuffix("test_diff.png"))
    }

    @Test("Reference exists returns false for missing file")
    func referenceNotFound() {
        let storage = SnapshotStorage(testFilePath: "/nonexistent/MyTests.swift")
        #expect(storage.referenceExists(named: "missing") == false)
    }
}
