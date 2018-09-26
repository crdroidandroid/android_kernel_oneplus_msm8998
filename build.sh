#!/bin/bash

clear

export ARCH=arm64 && SUBARCH=arm64
export CROSS_COMPILE=/home/haikalizz06/toolchain/bin/aarch64-linux-android-
export KBUILD_BUILD_USER=haikalizz
export KBUILD_BUILD_HOST=h1
make O=out lineage_oneplus5_defconfig
make O=out -j$(nproc --all)

cp /home/haikalizz06/dumpling/out/arch/arm64/boot/Image.gz-dtb /home/haikalizz06/oneplus/kernels/pie
cd /home/haikalizz06/oneplus/
zipfile="SenseiDumpling-$version-$(date +"%Y-%m-%d(%I.%M%p)").zip"
echo $zipfile
zip -r $zipfile * -x README*
curl --upload-file ./$zipfile https://transfer.sh/$zipfile
