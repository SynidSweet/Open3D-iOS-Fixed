
cd Open3D

wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/Assimp.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/Faiss.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/IrrXML.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/JPEG.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/jsoncpp.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/libOpen3D.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/libOpen3D_3rdparty_liblzf.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/libOpen3D_3rdparty_qhullcpp.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/libOpen3D_3rdparty_qhull_r.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/libOpen3D_3rdparty_rply.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/png.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/pybind.a.xcframework.zip
wget https://github.com/kewlbear/Open3D-iOS/releases/download/0.0.20220804014308/TBB.xcframework.zip


TAG=0.0.`date +%Y%m%d%H%M%S`

sed s/TAG/$TAG/g ../Package.swift.in > Package.swift

for f in *.zip
do
	rm Package.swift.in
	mv Package.swift Package.swift.in
	sed s/"$f"_CHECKSUM/`swift package compute-checksum $f`/ Package.swift.in > Package.swift
done

rm ../Package.swift
mv Package.swift ..


echo "::set-output name=tag::$TAG"
