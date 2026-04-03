import Testing
@testable import SnapshotKit

@Suite("SnapshotError Tests")
struct SnapshotErrorTests {
    @Test("Mismatch error includes difference percentage")
    func mismatchDescription() {
        let error = SnapshotError.mismatch(
            difference: 0.15,
            referencePath: "/ref.png",
            failurePath: "/fail.png",
            diffPath: "/diff.png"
        )
        #expect(error.description.contains("15.00%"))
    }

    @Test("Reference not found includes path")
    func referenceNotFoundDescription() {
        let error = SnapshotError.referenceNotFound(path: "/snapshots/test.png")
        #expect(error.description.contains("/snapshots/test.png"))
    }

    @Test("Rendering failed has description")
    func renderingFailed() {
        let error = SnapshotError.renderingFailed
        #expect(!error.description.isEmpty)
    }

    @Test("Size mismatch includes dimensions")
    func sizeMismatch() {
        let error = SnapshotError.sizeMismatch(expectedWidth: 100, expectedHeight: 200, actualWidth: 150, actualHeight: 250)
        #expect(error.description.contains("100"))
        #expect(error.description.contains("200"))
    }
}
