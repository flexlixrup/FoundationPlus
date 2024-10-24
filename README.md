# FoundationPlus

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fflexlixrup%2FFoundationPlus%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/flexlixrup/FoundationPlus)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fflexlixrup%2FFoundationPlus%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/flexlixrup/FoundationPlus)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Overview

This package extends the Swift Foundation framework with extensions to existing types and (in future) entirely new types.

## Requirements

Swift 6.0+

## Installation

### Swift Package Manager

To integrate `FoundationPlus` into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Select `File` > `Swift Packages` > `Add Package Dependency...`.
3. Enter the package repository URL: `https://github.com/flexlixrup/FoundationPlus`.
4. Choose the latest release or specify a version range.
5. Add the package to your target.

Alternatively, you can add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/flexlixrup/FoundationPlus", from: "1.0.0")
]
```

Then, include `FoundationPlus` as a dependency in your target:

```swift
.target(
    name: "YourTargetName",
    dependencies: [
        "FoundationPlus"
    ]),
```

## Usage

The full documentation is provided via DocC on [Swift Package Manager](https://swiftpackageindex.com/flexlixrup/FoundationPlus).

## Contributing

If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions, feel free to open an issue.
