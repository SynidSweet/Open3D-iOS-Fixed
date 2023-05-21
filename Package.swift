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
        .binaryTarget(name: "Assimp", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/Assimp.xcframework.zip", checksum: ""),
        .binaryTarget(name: "Faiss", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/Faiss.xcframework.zip", checksum: ""),
        .binaryTarget(name: "IrrXML", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/IrrXML.xcframework.zip", checksum: ""),
        .binaryTarget(name: "JPEG", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/JPEG.xcframework.zip", checksum: ""),
        .binaryTarget(name: "jsoncpp", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/jsoncpp.xcframework.zip", checksum: ""),
        .binaryTarget(name: "libOpen3D_3rdparty_liblzf.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/libOpen3D_3rdparty_liblzf.a.xcframework.zip", checksum: ""),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/libOpen3D_3rdparty_qhull_r.a.xcframework.zip", checksum: ""),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip", checksum: ""),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/libOpen3D_3rdparty_rply.a.xcframework.zip", checksum: ""),
        .binaryTarget(name: "libOpen3D.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/libOpen3D.a.xcframework.zip", checksum: "libOpen3D.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "png", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/png.xcframework.zip", checksum: ""),
        .binaryTarget(name: "pybind.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/pybind.a.xcframework.zip", checksum: "pybind.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "TBB", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521043853/TBB.xcframework.zip", checksum: ""),
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
