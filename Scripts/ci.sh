#sh Scripts/toolchain.sh

#TAG=0.0.`date +%Y%m%d%H%M%S`

TAG=0.0.20230521025423

sh Scripts/package.sh $TAG

echo "::set-output name=tag::$TAG"
