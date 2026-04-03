import Testing
@testable import SnapshotKit

@Suite("DevicePreset Tests")
struct DevicePresetTests {
    @Test("All presets have valid sizes")
    func validSizes() {
        for preset in DevicePreset.allCases {
            #expect(preset.size.width > 0)
            #expect(preset.size.height > 0)
        }
    }

    @Test("iPhone 15 has correct size")
    func iPhone15() {
        let size = DevicePreset.iPhone15.size
        #expect(size.width == 393)
        #expect(size.height == 852)
    }

    @Test("iPhone SE has correct size")
    func iPhoneSE() {
        let size = DevicePreset.iPhoneSE.size
        #expect(size.width == 375)
        #expect(size.height == 667)
    }

    @Test("iPad Pro 13 has correct size")
    func iPadPro13() {
        let size = DevicePreset.iPadPro13.size
        #expect(size.width == 1024)
        #expect(size.height == 1366)
    }

    @Test("All presets have names")
    func names() {
        for preset in DevicePreset.allCases {
            #expect(!preset.name.isEmpty)
        }
    }

    @Test("CaseIterable returns all 6 presets")
    func allCases() {
        #expect(DevicePreset.allCases.count == 6)
    }
}
