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
        .binaryTarget(name: "Assimp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/Assimp.xcframework.zip", checksum: "6904cc87d6001158a44caffb854e32b30e29adb606f46472d5f8ce00b9721a24"),
        .binaryTarget(name: "Faiss", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/Faiss.xcframework.zip", checksum: "1d223aee5b8c550f67e937da850e9a612fbfd358b2b9573b1c9e377f29e59a72"),
        .binaryTarget(name: "IrrXML", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/IrrXML.xcframework.zip", checksum: "fd60a0ad4f9330f7a6c9553621e0ba4cba1d678a89bbb2b5bfce730f8b39235b"),
        .binaryTarget(name: "JPEG", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/JPEG.xcframework.zip", checksum: "1a9cd104c1600703a52d6917a7c2213417f6c456ccef06688580b9f6b8bd4503"),
        .binaryTarget(name: "jsoncpp", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/jsoncpp.xcframework.zip", checksum: "350af41078a47080385fd60e5ecc2f33c2cb21a91557cb6b5233f38b306f50a4"),
        .binaryTarget(name: "libOpen3D_3rdparty_liblzf.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/libOpen3D_3rdparty_liblzf.a.xcframework.zip", checksum: "b8743bb8d3eaa06f44afba1a9d40c729a1fe9fd33d70a49e6f99bf87cfbbeb80"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/libOpen3D_3rdparty_qhull_r.a.xcframework.zip", checksum: "977969ac72ce6a58c681f06e6b9d3ced0048b0841d1830f0bb8778a3416b7bf5"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip", checksum: "1b6acfb484710186a112c0bf3d57bcdd2bf1d050b330dd73888e7dbb7ff82c20"),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/libOpen3D_3rdparty_rply.a.xcframework.zip", checksum: "d3ef3e608cd8459d6d7371978929f55eee8e353b3772db0ce81f388430120dd1"),
        .binaryTarget(name: "libOpen3D.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/libOpen3D.a.xcframework.zip", checksum: "57ef73f16d19bcd9d14a5f7cfabdcc54a07c506015820e2326af39b642c10809"),
        .binaryTarget(name: "png", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/png.xcframework.zip", checksum: "0fd051316b200e5663d6d92e2efb24d0c012b417119733be9a498559cae173ea"),
        .binaryTarget(name: "pybind.a", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220322034617/pybind.a.xcframework.zip", checksum: "4dc1926710aaa6dd86c97a2b6d6b1793f6526747e8f9d80a0cfdc7bc5b335fe3"),
        .binaryTarget(name: "TBB", url: "https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/TBB.xcframework.zip", checksum: "9c5d9a4aa45ca15cec514a36faf10709a44af8e780441bf9c6d82a0fd0c64e60"),
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
