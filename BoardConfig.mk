#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FORCE_32_BIT := true

# inherit from the proprietary version
-include vendor/wiko/l5510/BoardConfigVendor.mk
include device/cyanogen/msm8916-common/Android.mk
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/wiko/l5510

# Android config
BOARD_CHARGER_ENABLE_SUSPEND := true
FORCE_32_BIT := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -Wno-error
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel
BOARD_KERNEL_CMDLINE 	     += androidboot.selinux=permissive
TARGET_KERNEL_CONFIG 	     := msm8916_l5510_defconfig
BOARD_KERNEL_TAGS_OFFSET     := 0x00000100
BOARD_RAMDISK_OFFSET	     := 0x01000000

# Qualcomm Hardware
#TARGET_USES_NEW_ION_API 	:= true
TARGET_USE_ION_COMPAT 		:= true
TARGET_USES_QCOM_BSP 		:= true

#Add support for firmare upgrade on 8916
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true

# Camera
#BOARD_CAMERA_SENSORS := \
#    ov5670_q5v41b \
#    ov8865_q8v18a
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# GPS
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1702887424
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12936655872
BOARD_CACHEIMAGE_PARTITION_SIZE := 274726912
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
#RECOVERY_VARIANT                := twrp
BOARD_HAS_NO_SELECT_BUTTON 	:= true
BOARD_RECOVERY_SWIPE 		:= true
#TARGET_RECOVERY_FSTAB 		:= $(LOCAL_PATH)/twrp.fstab
TARGET_RECOVERY_PIXEL_FORMAT 	:= BGRA_8888
TARGET_OTA_ASSERT_DEVICE 	:= l5510,ridge4g
ENABLE_ADB_DIAG_IN_PWROFF_CHARGE := true

# TWRP Flags
DEVICE_RESOLUTION               := 720x1280
RECOVERY_SDCARD_ON_DATA		:= true
TW_BRIGHTNESS_PATH		:= /sys/class/leds/lcd-backlight/brightness
TW_TARGET_USES_QCOM_BSP		:= true
RECOVERY_SDCARD_ON_DATA 	:= true
TW_INTERNAL_STORAGE_PATH 	:= "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
# This fixes the slow wiping of partitions
COMMON_GLOBAL_CFLAGS		+= -DNO_SECURE_DISCARD 



BOARD_SEPOLICY_DIRS += \
    device/wiko/l5510/sepolicy

BOARD_SEPOLICY_UNION += \
    device.te \
    file.te \
    file_contexts \
    genfs_contexts \
    netd.te \
    ppp.te \
    vold.te

TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop