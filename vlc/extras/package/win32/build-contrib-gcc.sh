#!/bin/sh

set -e
set -x

info()
{
    echo "[INFO] $1"
}

VLC_ROOT_PATH="/d/vlc"
BUILD_ROOT_PATH="/d/build_vlc_gcc"
JOBS=16
TRIPLET="x86_64-w64-mingw32"

#--------------------------------------------------------------------------------------
# build /d/vlc/contrib
#--------------------------------------------------------------------------------------
export USE_FFMPEG=1 #compile contribs with avcodec ...
export CONTRIB_SRC_DIR="${BUILD_ROOT_PATH}/contrib/contrib-win64"
export CONTRIB_OUTPUT_DIR="${BUILD_ROOT_PATH}/contrib/${TRIPLET}"
export PKG_CONFIG="pkg-config"
export PKG_CONFIG_LIBDIR="${CONTRIB_OUTPUT_DIR}/lib/pkgconfig"
export PATH="${VLC_ROOT_PATH}/extras/tools/build/bin:${CONTRIB_OUTPUT_DIR}/bin":$PATH
export EXTRA_CFLAGS="-D_WIN32_WINNT=0x0601 -DWINVER=0x0601 -D__MSVCRT_VERSION__=0x0700"
export CFLAGS="$CFLAGS $EXTRA_CFLAGS"
export CPPFLAGS="$CPPFLAGS $EXTRA_CFLAGS"
export CXXFLAGS="$CXXFLAGS $CPPFLAGS"

mkdir -p ${CONTRIB_SRC_DIR}
cd ${CONTRIB_SRC_DIR}

info "-----Bootstrapping contrib to ${CONTRIB_SRC_DIR}/Makefile-----"
${VLC_ROOT_PATH}/contrib/bootstrap --host=${TRIPLET} --prefix=${CONTRIB_OUTPUT_DIR} $CONTRIB_FLAGS

info "-----Compiling ${CONTRIB_SRC_DIR}/Makefile-----"
make list
make -j$JOBS fetch
make -j$JOBS

cd ${BUILD_ROOT_PATH}
info "-----Build contribs all done.-----"
