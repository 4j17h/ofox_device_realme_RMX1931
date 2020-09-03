#!/bin/bash
TARGET_DEVICE=RMX1931
# configure some default settings for the build
Default_Settings() {
#export FOX_USE_LZMA_COMPRESSION="1"
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_ADVANCED_SECURITY="1"	
export FOX_ADVANCED_STOCK_REPLACE="1"
export FOX_BUILD_FULL_KERNEL_SOURCES="1"
export FOX_BUILD_TYPE="Beta"	
export FOX_DELETE_AROMAFM="1"
export FOX_R11="1"
export FOX_REPLACE_BUSYBOX_PS="1"
export FOX_RESET_SETTINGS="1"	
export FOX_USE_BASH_SHELL="1"
export FOX_USE_NANO_EDITOR="1"
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
export FOX_VERSION="R11.0"	
export LC_ALL="C"
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
export OF_FLASHLIGHT_ENABLE="1"
export OF_MAINTAINER="AJITH"
export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
export OF_PATCH_AVB20="1"
export OF_SCREEN_H="2400"
export OF_STATUS_INDENT_LEFT="48"
export OF_STATUS_INDENT_RIGHT="48"
export OF_SUPPORT_OZIP_DECRYPTION="1"
export OF_TARGET_DEVICES="RMX1931,RMX1931CN,RMX1931L1"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
export OF_USE_NEW_MAGISKBOOT="1"
export TARGET_ARCH="arm64"
export TW_DEVICE_VERSION="R11.0"
export USE_CCACHE="1"

	# lzma
  	[ "$FOX_USE_LZMA_COMPRESSION" = "1" ] && export LZMA_RAMDISK_TARGETS="recovery"
}

# build the project
do_build() {
  Default_Settings

  # use ccache ??
  [ "$USE_CCACHE" = "1" ] && ccache -M 20G

  # compile it
  . build/envsetup.sh

  lunch omni_"$TARGET_DEVICE"-eng

  mka recoveryimage -j$(nproc --all) && cd device/realme/RMX1931
}

# --- main --- #
cd .. && cd .. && cd .. && do_build
#
