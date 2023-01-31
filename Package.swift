// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "dictionary-coding",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "DictionaryCoding", targets: ["DictionaryCoding"])
    ],
    targets: [
        .target(
            name: "DictionaryCoding",
            path: "Sources"
        ),
        .testTarget(name: "DictionaryCodingTests",
                    dependencies: [
                        .target(name: "DictionaryCoding")
                    ],
                    path: "Tests"
        )
    ]
)
