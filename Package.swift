// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Tapsnap",
    products: [
        .executable(name: "Tapsnap", targets: ["Tapsnap"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Tapsnap",
            dependencies: ["Publish"]
        )
    ]
)
