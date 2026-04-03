import Testing
import Foundation
@testable import SnapshotKit

@Suite("ImageComparator Tests")
struct ImageComparatorTests {
    @Test("Identical data returns 0.0")
    func identical() {
        let data = Data([0, 1, 2, 3, 4, 5])
        let difference = ImageComparator.compare(data, data)
        #expect(difference == 0.0)
    }

    @Test("Completely different data returns 1.0")
    func completelyDifferent() {
        let data1 = Data([0, 0, 0, 0])
        let data2 = Data([255, 255, 255, 255])
        let difference = ImageComparator.compare(data1, data2)
        #expect(difference == 1.0)
    }

    @Test("Partially different data returns ratio")
    func partialDifference() {
        let data1 = Data([0, 0, 0, 0])
        let data2 = Data([0, 0, 255, 255])
        let difference = ImageComparator.compare(data1, data2)
        #expect(difference == 0.5)
    }

    @Test("Different sized data returns 1.0")
    func differentSizes() {
        let data1 = Data([0, 1, 2])
        let data2 = Data([0, 1])
        let difference = ImageComparator.compare(data1, data2)
        #expect(difference == 1.0)
    }

    @Test("Empty data returns 0.0")
    func emptyData() {
        let data = Data()
        let difference = ImageComparator.compare(data, data)
        #expect(difference == 0.0)
    }
}
