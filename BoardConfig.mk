#USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/fujitsu/mx532/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := tegra
#TARGET_TEGRA_VERSION := t30

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

TARGET_BOOTLOADER_BOARD_NAME := chagall

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28940697600
BOARD_FLASH_BLOCK_SIZE := 2048

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm4329_apsta.bin"

# Recovery
TARGET_RECOVERY_FSTAB := device/fujitsu/mx532/prebuilt/ramdisk/recovery.fstab
RECOVERY_FSTAB_VERSION := 2
#BOARD_TOUCH_RECOVERY := true
TARGET_RECOVERY_INITRC := device/fujitsu/mx532/prebuilt/ramdisk/init.recovery.chagall.rc

# Kernel
TARGET_KERNEL_SOURCE := kernel/fujitsu/mx532
#TARGET_PREBUILT_KERNEL := device/fujitsu/mx532/kernel
TARGET_KERNEL_CONFIG := tegra3_chagall_eng_android_kitkat_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := vendor/fujitsu/mx532/proprietary/system/lib/egl/egl.cfg
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
#BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

#Sepolicy
BOARD_SEPOLICY_DIRS += \
	device/fujitsu/mx532/sepolicy
	
BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    app.te \
    bdaddwriter.te \
    device.te \
    drmserver.te \
    init_shell.te \
    file.te \
    rild.te \
    sensors_config.te \
    shell.te \
    surfaceflinger.te \
    system.te \
    zygote.te
