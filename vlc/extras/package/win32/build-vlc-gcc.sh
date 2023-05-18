#!/bin/bash

set -ex

info()
{
    echo "[INFO] $1"
}

VLC_ROOT_PATH="/d/vlc"
BUILD_ROOT_PATH="/d/build_vlc_gcc"
TRIPLET="x86_64-w64-mingw32"
JOBS=16

#--------------------------------------------------------------------------------------
# build /d/vlc
#--------------------------------------------------------------------------------------
BUILD_TARGET_DIR=${BUILD_ROOT_PATH}/win64
INSTALL_DIR="/mingw64"
CONTRIB_OUTPUT_DIR="${BUILD_ROOT_PATH}/contrib/${TRIPLET}"
EXTRA_CFLAGS="-D_WIN32_WINNT=0x0601 -DWINVER=0x0601 -D__MSVCRT_VERSION__=0x0700 -g"
export CFLAGS="$CFLAGS $EXTRA_CFLAGS"
export CPPFLAGS="$CPPFLAGS $EXTRA_CFLAGS"
export CXXFLAGS="$CXXFLAGS $CPPFLAGS"
export PATH="${CONTRIB_OUTPUT_DIR}/bin:$PATH"
export PKG_CONFIG="pkg-config"
export PKG_CONFIG_LIBDIR="${CONTRIB_OUTPUT_DIR}/lib/pkgconfig"

info "-----Bootstrapping VLC-----"
cd ${BUILD_ROOT_PATH}
if [ ! -f ${VLC_ROOT_PATH}/configure ]; then
    ${VLC_ROOT_PATH}/bootstrap
fi

info "-----Configuring VLC to ${BUILD_TARGET_DIR}/Makefile-----"
mkdir -p ${BUILD_TARGET_DIR}
cd ${BUILD_TARGET_DIR}
${VLC_ROOT_PATH}/configure --prefix="${INSTALL_DIR}" --host=${TRIPLET} --with-contrib=${CONTRIB_OUTPUT_DIR} ${VLC_FLAGS}

info "-----Compiling VLC-----"
make -j${JOBS}

info "-----Packing VLC-----"
make package-win-install

info "-----Build VLC all done.-----"
