// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Open3D-iOS",
    products: [
        .library(
            name: "Open3D-iOS",
            targets: [
                "LinkOpen3D",
                "Open3DSupport",
                "Assimp",
                "Faiss",
                "IrrXML",
                "JPEG",
                "jsoncpp",
                "libOpen3D_3rdparty_liblzf.a",
                "libOpen3D_3rdparty_qhull_r.a",
                "libOpen3D_3rdparty_qhullcpp.a",
                "libOpen3D_3rdparty_rply.a",
                "libOpen3D.a",
                "png",
                "pybind.a",
                "TBB",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/NumPy-iOS.git", .branch("main")),
        .package(url: "https://github.com/kewlbear/LAPACKE-iOS.git", .branch("main")),
        .package(url: "https://github.com/kewlbear/BLAS-LAPACK-AppStore-Workaround.git", .branch("main")),
    ],
    targets: [
        .binaryTarget(name: "Assimp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/Assimp.xcframework.zip", checksum: "6dc00569e5138fd68766529310dd1b4a80a8bbec9b1f390aa1013817a1f5b782"),
        .binaryTarget(name: "Faiss", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/Faiss.xcframework.zip", checksum: "23db476d1d856039dd24668146752e16aec98e4912b220d8ab3c6d9e49a8bc3d"),
        .binaryTarget(name: "IrrXML", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/IrrXML.xcframework.zip", checksum: "2c27f2351718ffdba2ce8924ec1ddc947c1a07bd9c7046828cdeaa56d3b2b21f"),
        .binaryTarget(name: "JPEG", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/JPEG.xcframework.zip", checksum: "d0ed81610d2364b79770392e8dd3c291a78785feac65110609dc41bb9dba9932"),
        .binaryTarget(name: "jsoncpp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/jsoncpp.xcframework.zip", checksum: "8c6e9d4bd8750d41ff5819c019e776746b3771dcba716edf71119c5c5435a849"),
        .binaryTarget(name: "libOpen3D_3rdparty_liblzf.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/libOpen3D_3rdparty_liblzf.a.xcframework.zip", checksum: "2b0ca2b7bffdacee4f6cea8f06bbf79ce7a236ba5fa12c6a67bd3b1081279bcb"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/libOpen3D_3rdparty_qhull_r.a.xcframework.zip", checksum: "98f01c7df07775c33884b0a9ff3bf357438129a82f44c1c501370e53e269d962"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip", checksum: "4cd00df446f619fe74f4d762cc1a53c14a48eece18c1241c21d4f365130e034b"),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/libOpen3D_3rdparty_rply.a.xcframework.zip", checksum: "b01c13e60d5f01b33542103dd6818b996570869a4dc1b932992ba145d965314c"),
        .binaryTarget(name: "libOpen3D.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/libOpen3D.a.xcframework.zip", checksum: "libOpen3D.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "png", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/png.xcframework.zip", checksum: "09e10fef165f1df3a66e87a445f572c1cb745769bab5176ecb80bdfbd37ac7c1"),
        .binaryTarget(name: "pybind.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/pybind.a.xcframework.zip", checksum: "pybind.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "TBB", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230521025423/TBB.xcframework.zip", checksum: "ebd783ec95ebcbe7bb31f0bc0d2b4b07df8d4e836ae930fb7f9b8505c5123952"),
        .target(
            name: "LinkOpen3D",
            dependencies: [
                "NumPy-iOS",
                "LAPACKE-iOS",
                "Assimp",
                "Faiss",
                "IrrXML",
                "JPEG",
                "jsoncpp",
                "libOpen3D_3rdparty_liblzf.a",
                "libOpen3D_3rdparty_qhull_r.a",
                "libOpen3D_3rdparty_qhullcpp.a",
                "libOpen3D_3rdparty_rply.a",
                "libOpen3D.a",
                "png",
                "pybind.a",
                "TBB",
                "BLAS-LAPACK-AppStore-Workaround",
            ],
            linkerSettings: [
                .linkedLibrary("stdc++"),
            ]
        ),
        .target(
            name: "Open3DSupport",
            resources: [.copy("site-packages")]),
        .testTarget(
            name: "Open3D-iOSTests",
            dependencies: ["Open3DSupport"]),
    ]
)
