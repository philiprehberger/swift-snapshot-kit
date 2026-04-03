import Foundation

/// Compares two images at the byte level
public struct ImageComparator: Sendable {
    /// Compare two image data blobs and return the difference ratio (0.0 = identical, 1.0 = completely different)
    ///
    /// This performs a simple byte-level comparison. For pixel-accurate comparison on Apple platforms,
    /// use platform-specific rendering.
    public static func compare(_ data1: Data, _ data2: Data) -> Double {
        guard data1.count == data2.count, !data1.isEmpty else {
            return data1 == data2 ? 0.0 : 1.0
        }

        var differentBytes = 0
        let count = data1.count

        data1.withUnsafeBytes { ptr1 in
            data2.withUnsafeBytes { ptr2 in
                let bytes1 = ptr1.bindMemory(to: UInt8.self)
                let bytes2 = ptr2.bindMemory(to: UInt8.self)
                for i in 0..<count {
                    if bytes1[i] != bytes2[i] {
                        differentBytes += 1
                    }
                }
            }
        }

        return Double(differentBytes) / Double(count)
    }
}
