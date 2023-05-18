#!/bin/bash

set -ex

#pacman -S mingw-w64-x86_64-curl
#pacman -S mingw-w64-x86_64-wget
#pacman -S mingw-w64-x86_64-7zip
#pacman -S mingw-w64-x86_64-bzip2
#pacman -S mingw-w64-x86_64-file
#pacman -S mingw-w64-x86_64-pkg-config
#pacman -S mingw-w64-x86_64-gcc
#pacman -S mingw-w64-x86_64-make
#pacman -S mingw-w64-x86_64-automake
#pacman -S mingw-w64-x86_64-autoconf
#pacman -S mingw-w64-x86_64-cmake
#pacman -S mingw-w64-x86_64-libtool
#pacman -S mingw-w64-x86_64-nasm
#pacman -S mingw-w64-x86_64-yasm
#pacman -S mingw-w64-x86_64-gperf
#pacman -S mingw-w64-x86_64-texinfo
#pacman -S mingw-w64-x86_64-gettext
#pacman -S mingw-w64-x86_64-ca-certificates
#pacman -S mingw-w64-x86_64-python3
#pacman -S mingw-w64-x86_64-lldb

#VLC CONTRIB is built with GNU C++14 10.1.0 && GNU GCC 10.1.0 && GNU libtool 2.4.6 on Debian-2.4.6-15
VLC_CONTRIB_SHA512SUM="$(cd /d/vlc; /d/vlc/extras/ci/get-contrib-sha.sh)"
VLC_PREBUILT_CONTRIBS_URL="https://artifacts.videolan.org/vlc/win64/vlc-contrib-x86-64-w64-mingw32-${VLC_CONTRIB_SHA512SUM}.tar.bz2"

export CONTRIB_FLAGS="
    --disable-optim
    --disable-aom
    --disable-bluray
    --disable-x265
    --disable-srt
    --disable-chromaprint
    --disable-microdns
    --disable-taglib
    --disable-dav1d
    --disable-ebml
    --disable-fluidlite
    --disable-schroedinger
    --disable-glew
    --disable-matroska
    --disable-soxr 
    --disable-libebur128
    --disable-goom
    --disable-projectM
    --disable-mpcdec
    --disable-rav1e
    --disable-mad
    --disable-nvcodec
    --disable-mfx
    --disable-orc
    --disable-mysofa
    --disable-spatialaudio
    --disable-aribb24
    --disable-aribb25
    --disable-harfbuzz
    --disable-ass
    --disable-gettext
    --disable-qt
    "

# the gcc toolchain can not support pdb file options: -d -D D:/vlc
# the official web sugguestion is: use clang llvm toolchain.
/d/vlc/extras/package/win32/build-contrib-gcc.sh -a x86_64

