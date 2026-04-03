import Testing
@testable import SnapshotKit

@Suite("SnapshotConfig Tests")
struct SnapshotConfigTests {
    @Test("Default config uses iPhone 15 size")
    func defaultConfig() {
        let config = SnapshotConfig.default
        #expect(config.width == 393)
        #expect(config.height == 852)
        #expect(config.tolerance == 0.0)
    }

    @Test("Custom config preserves values")
    func customConfig() {
        let config = SnapshotConfig(width: 100, height: 200, tolerance: 0.05)
        #expect(config.width == 100)
        #expect(config.height == 200)
        #expect(config.tolerance == 0.05)
    }

    @Test("Config from device preset")
    func fromPreset() {
        let config = SnapshotConfig(size: DevicePreset.iPhoneSE.size)
        #expect(config.width == 375)
        #expect(config.height == 667)
    }

    @Test("Default traits are light mode, medium type")
    func defaultTraits() {
        let config = SnapshotConfig.default
        #expect(config.traits.colorScheme == .light)
        #expect(config.traits.dynamicTypeOption == .medium)
    }
}
