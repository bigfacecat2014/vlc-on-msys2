#!/bin/bash

export VLC_FLAGS="
--enable-debug
--enable-maintainer-mode
--enable-dependency-tracking
--disable-silent-rules
--disable-optimizations
--disable-pdb
--disable-nls
--disable-dbus
--enable-sout
--disable-lua
--disable-vlm
--disable-addonmanagermodules
--disable-archive
--disable-live555
--disable-dc1394
--disable-dv1394
--disable-linsys
--disable-dvdread
--disable-dvdnav
--disable-bluray
--disable-opencv
--disable-smbclient
--disable-dsm
--disable-sftp
--disable-nfs
--disable-smb2
--disable-v4l2
--disable-nvdec
--disable-decklink
--disable-vcd
--disable-libcddb
--disable-screen
--disable-vnc
--disable-freerdp
--disable-asdcp
--disable-dvbpsi
--disable-gme
--disable-sid
--enable-ogg
--disable-shout
--enable-matroska
--disable-mod
--disable-mpc
--disable-shine
--disable-omxil
--disable-rpi-omxil
--disable-mad
--enable-mpg123
--disable-gst-decode
--disable-libva
--enable-dxva2
--enable-d3d11va
--disable-merge-ffmpeg
--enable-avcodec
--enable-avformat
--enable-swscale
--enable-postproc
--enable-faad
--disable-fdkaac
--disable-aom
--disable-rav1e
--disable-dav1d
--disable-vpx
--disable-twolame
--disable-a52
--disable-dca
--disable-flac
--disable-libmpeg2
--disable-vorbis
--disable-tremor
--disable-speex
--disable-rnnoise
--disable-opus
--disable-spatialaudio
--disable-theora
--disable-oggspots
--disable-daala
--disable-schroedinger
--enable-png
--enable-jpeg
--disable-bpg
--disable-x262
--disable-x265
--disable-x264
--disable-x26410b
--disable-mfx
--disable-fluidsynth
--disable-fluidlite
--disable-zvbi
--disable-telx
--disable-aribsub
--disable-aribb25
--disable-kate
--disable-tiger
--disable-css
--disable-libplacebo
--disable-gles2
--disable-vulkan
--disable-xcb
--disable-vdpau
--disable-wayland
--enable-freetype
--disable-fribidi
--disable-harfbuzz
--disable-fontconfig
--disable-libass
--disable-svg
--disable-svgdec
--enable-directx
--disable-kms
--disable-caca
--disable-kva
--disable-mmal
--disable-pulse
--disable-alsa
--disable-oss
--disable-sndio
--enable-wasapi
--disable-jack
--disable-opensles
--disable-samplerate
--disable-soxr
--disable-ebur128
--disable-kai
--disable-chromaprint
--disable-chromecast
--enable-qt
--disable-qt-qml-cache
--disable-qt-qml-debug
--disable-skins2
--disable-libtar
--disable-macosx
--disable-sparkle
--disable-ncurses
--disable-lirc
--disable-bitstream
--disable-srt
--disable-goom
--disable-projectm
--disable-vsxu
--disable-avahi
--disable-udev
--disable-mtp
--disable-upnp
--disable-microdns
--disable-libxml2
--disable-libgcrypt
--disable-gnutls
--disable-taglib
--disable-secret
--disable-kwallet
--disable-update-check
--disable-gbm
--disable-notify
--disable-medialibrary
--enable-vlc
"

/d/vlc/extras/package/win32/build-vlc-gcc.sh -a x86_64

#--------------------------------------------------------------------------------------------------
# package dependency
#--------------------------------------------------------------------------------------------------
#package-win-install(cp to /mingw64/ just as make install)
#package-win-sdk(cp to /d/build_vlc/win64/vlc-4.0.0-dev/sdk/) : package-win-install
#package-win-common (cp) : package-win-sdk
#package-win32-debug-zip (cp & zip) : package-win-common

#package-win-strip(strip) : package-win-common
#package-win32-zip (strip & zip) : package-win-strip
#package-win32-7zip (strip & 7z) : package-win-strip
#package-win32-exe (strip & NSIS) : package-win-strip
#package-wince((WindowsCE zip) : package-win-strip

#package-win32-cleanup (rm -rf)
#package-win32 (strip & zip & 7z && NSIS) : package-win32-zip package-win32-7zip package-win32-exe
#package-win32-debug(zip & 7z) : package-win32-debug-zip package-win32-debug-7zip

#package-win32-release : package-win-strip /mingw64/NSIS/nsProcess.dll package-win-sdk