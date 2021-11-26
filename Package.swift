// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "TypedTextAttributes",  
  platforms: [
    .macOS(.v10_12),
    .iOS(.v11),
    .tvOS(.v10),
    .watchOS(.v3)
  ],
  products: [
    .library(name: "TypedTextAttributes", targets: ["TypedTextAttributes"]),   
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "TypedTextAttributes", dependencies: [], path: "TypedTextAttributes"),
  ],
  swiftLanguageVersions: [.v5]
)
