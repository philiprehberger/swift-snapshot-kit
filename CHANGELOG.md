# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-04-02

### Added
- `assertSnapshot` function for comparing SwiftUI views against reference images
- `SnapshotConfig` with size, traits, and tolerance configuration
- `SnapshotTraits` for color scheme and dynamic type size
- `DevicePreset` enum with common device sizes (iPhone, iPad)
- `ImageComparator` for pixel-level image comparison
- `DiffGenerator` for creating visual diff images
- `SnapshotStorage` for reference image file management
- Record mode for generating initial reference snapshots
- Configurable tolerance for acceptable pixel differences
- CI-friendly operation with clear failure messages
- Zero external dependencies
