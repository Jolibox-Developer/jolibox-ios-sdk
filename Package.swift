// swift-tools-version: 5.9
import PackageDescription

let releaseBase = "https://github.com/Jolibox-Developer/jolibox-ios-sdk/releases/download/0.3.0"

let package = Package(
    name: "JoliboxSDKAll",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "JoliboxSDKAll", targets: ["JoliboxSDKAll"])
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.7.0")
    ],
    targets: [
        .binaryTarget(name: "Jolibox", url: "\(releaseBase)/Jolibox-0.3.0.xcframework.zip", checksum: "6400f808d5de19c62c37df6495f63261863191a8bb674870733d9bc7348f2e29"),
        .binaryTarget(name: "IGListDiffKit", url: "\(releaseBase)/IGListDiffKit-5.1.0.xcframework.zip", checksum: "940b2ea3a2c305d2127ab1058779c159814db6cc033faf8d1f1b69969cb796a4"),
        .binaryTarget(name: "IGListKit", url: "\(releaseBase)/IGListKit-5.1.0.xcframework.zip", checksum: "1e7cee7a8919afc3417bb0a2d811ffd92c024aff8a9568e42cca3faa3bc13306"),
        .binaryTarget(name: "IGListSwiftKit", url: "\(releaseBase)/IGListSwiftKit-5.1.0.xcframework.zip", checksum: "faf3557d529d68f671d5d82fde9c71195a5272f6bd93cf85c69f762d1480a982"),
        .target(
            name: "JoliboxSDKAll",
            dependencies: [
                "Jolibox",
                "IGListDiffKit",
                "IGListKit",
                "IGListSwiftKit",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ]
        )
    ]
)
