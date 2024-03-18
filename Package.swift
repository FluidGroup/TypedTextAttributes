// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "TypedTextAttributes",  
  platforms: [
    .macOS(.v10_13),
    .iOS(.v12),
    .tvOS(.v12),
    .watchOS(.v4)
  ],
  products: [
    .library(name: "TypedTextAttributes", targets: ["TypedTextAttributes"]),   
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "TypedTextAttributes", dependencies: []),
    .testTarget(name: "TypedTextAttributesTests", dependencies: ["TypedTextAttributes"])
  ],
  swiftLanguageVersions: [.v5]
)
