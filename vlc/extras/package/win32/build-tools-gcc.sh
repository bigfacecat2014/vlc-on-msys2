#!/bin/sh

set -e
set -x

info()
{
    echo "[INFO] $1"
}

VLC_ROOT_PATH="/d/vlc"
JOBS=16

#--------------------------------------------------------------------------------------
# build /d/vlc/extras/tools
#--------------------------------------------------------------------------------------
mkdir -p ${VLC_ROOT_PATH}/extras/tools
cd ${VLC_ROOT_PATH}/extras/tools
export PATH="${VLC_ROOT_PATH}/extras/tools/build/bin":$PATH

info "-----Bootstrapping tools-----"
${VLC_ROOT_PATH}/extras/tools/bootstrap

info "-----Compiling tools-----"
make -j$JOBS

info "-----Build /d/vlc/extras/tools all done.-----"
