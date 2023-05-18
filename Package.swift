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
        .binaryTarget(name: "Assimp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/Assimp.xcframework.zip", checksum: "b21329d4dd574bb9ce3f3092718ee3d064685d185c3f516cb04b522341438b78"),
        .binaryTarget(name: "Faiss", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/Faiss.xcframework.zip", checksum: "115339c58ae57403187bc0e99e1ef244595ac4790d8ef138bb80610cee90be36"),
        .binaryTarget(name: "IrrXML", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/IrrXML.xcframework.zip", checksum: "078b5760aa495d17ddd0bf3c951edb438f0ebb02c7e509fe0e8196e1ab82b411"),
        .binaryTarget(name: "JPEG", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/JPEG.xcframework.zip", checksum: "3a871e11dcde19895b015107aa5b6028063ca0eda0e2054fe05f9ce3cfd5e183"),
        .binaryTarget(name: "jsoncpp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/jsoncpp.xcframework.zip", checksum: "662b7044dd4b47ee1559d3cbbe33e57b431f2d3085018a595f7481a08b8c43b7"),
        .binaryTarget(name: "libOpen3D_3rdparty_liblzf.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/libOpen3D_3rdparty_liblzf.a.xcframework.zip", checksum: "8512c0fdfbcbf55f151648ae18f6883fc17bbfd9b77dc49f4030abda454245fb"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/libOpen3D_3rdparty_qhull_r.a.xcframework.zip", checksum: "3eb28f579f6edd584fc9e54027806c7e1f117c7c386a94a4098e825047fae592"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip", checksum: "499c9ad3147f0df45fa84db89e2f7e3602486bf4da51985b41a4c822be55178a"),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/libOpen3D_3rdparty_rply.a.xcframework.zip", checksum: "a882ed95eefd759ddeb2dc15b5021ce42e4aa0a2df58a8fed54334c18680ab55"),
        .binaryTarget(name: "libOpen3D.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/libOpen3D.a.xcframework.zip", checksum: "libOpen3D.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "png", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/png.xcframework.zip", checksum: "332df26a845cab19716d9257e6b6ca3342b3ce3f5a1ac5bf149ee998e2376a42"),
        .binaryTarget(name: "pybind.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/pybind.a.xcframework.zip", checksum: "pybind.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "TBB", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20230518161923/TBB.xcframework.zip", checksum: "4dea270a3d00d359bb77504011942bb44ab1a3180b0ecc7f2598af8a72534fc8"),
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
