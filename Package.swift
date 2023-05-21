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
        .binaryTarget(name: "Assimp", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/Assimp.xcframework.zip", checksum: "eca6b4c185027cd00a1080eb2105dfccf0222bc5fa25dcddbdf2f6f6886da9f8"),
        .binaryTarget(name: "Faiss", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/Faiss.xcframework.zip", checksum: "eeafef32d4fd235e51f614127a314e9558027e23198212ad6aa7afeec42e25ed"),
        .binaryTarget(name: "IrrXML", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/IrrXML.xcframework.zip", checksum: "33e38e499d5829c68506479fc762babe9d6234a78160ae01de8f59347d923d64"),
        .binaryTarget(name: "JPEG", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/JPEG.xcframework.zip", checksum: "3f7e3ad1242e6a03d821c21cb45f910eaacdf1d2752ccb76a0c472ba6cfcb433"),
        .binaryTarget(name: "jsoncpp", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/jsoncpp.xcframework.zip", checksum: "38193bec42c4c3d9f3cbfedaffe01bbed4f740adbfe6efb2d836f53199589d75"),
        .binaryTarget(name: "libOpen3D_3rdparty_liblzf.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/libOpen3D_3rdparty_liblzf.a.xcframework.zip", checksum: "f3458655958e717acac9da881dc060a4015b8968d4aa42da6ef49bb001ef313f"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/libOpen3D_3rdparty_qhull_r.a.xcframework.zip", checksum: "2d2348e3ca06ace021e5df59a455fb62be69fa45598aa56dedf5392dbe9afcc3"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip", checksum: "76b84c5fd063a9371ea73661906e5b8bdcf906bf0025828cd419a5489e5f7814"),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/libOpen3D_3rdparty_rply.a.xcframework.zip", checksum: "de322e9b46c7894fcd13e6be53c07e4c9cc8b1499e914f64cf27e44e082ad53b"),
        .binaryTarget(name: "libOpen3D.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/libOpen3D.a.xcframework.zip", checksum: "libOpen3D.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "png", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/png.xcframework.zip", checksum: "59f9ead2faf9ffa613a520d655d07b0534b0a32afe4f76a77193566e884e8304"),
        .binaryTarget(name: "pybind.a", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/pybind.a.xcframework.zip", checksum: "pybind.a.xcframework_CHECKSUM"),
        .binaryTarget(name: "TBB", url: "https://github.com/SynidSweet/Open3D-iOS-Fixed/releases/download/0.0.20230521062040/TBB.xcframework.zip", checksum: "7046a64d8025e5200c2f8097e914ccb9805e8128ac6dce86fe593c604bde0749"),
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
