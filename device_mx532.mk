$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/fujitsu/mx532/mx532-vendor.mk)

PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

WIFI_BAND := 802_11_BG

DEVICE_PACKAGE_OVERLAYS += device/fujitsu/mx532/overlay

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

LOCAL_PATH := device/fujitsu/mx532
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
# fstab files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/ramdisk/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/ramdisk/vold.fstab:recovery/root/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/ramdisk/init.chagall.rc:root/init.chagall.rc \
    $(LOCAL_PATH)/prebuilt/ramdisk/init.chagall.usb.rc:root/init.chagall.usb.rc \
    $(LOCAL_PATH)/prebuilt/ramdisk/ueventd.chagall.rc:root/ueventd.chagall.rc \
    $(LOCAL_PATH)/prebuilt/ramdisk/ueventd.chagall.rc:recovery/root/ueventd.chagall.rc \
    $(LOCAL_PATH)/prebuilt/ramdisk/fstab.chagall:root/fstab.chagall

# PPP libhuaweigeneric-ril
#PRODUCT_COPY_FILES += \
#		$(LOCAL_PATH)/ppp/ip-up:root/system/etc/ip-up \
#		$(LOCAL_PATH)/ppp/ip-down:root/system/etc/ip-down \


#PRODUCT_COPY_FILES += \
#		$(LOCAL_PATH)/prebuilt/ramdisk/init.recovery.chagall.rc:recovery/root/init.recovery.chagall.rc

PRODUCT_COPY_FILES += \
    device/fujitsu/mx532/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGES := \
		brcm_patchram_plus \
		setup_fs \
		mxt-app \
		libnetcmdiface \
		libdashplayer \
		librs_jni \
    make_ext4fs \
    audio.primary.tegra \
    libaudioutils \
    audio.a2dp.default \
    audio.usb.default \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

# Additional Build properties
PRODUCT_PROPERTY_OVERRIDES := \
    ro.zygote.disable_gl_preload=true
	
# media config xml file
PRODUCT_COPY_FILES += \
    device/fujitsu/mx532/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/fujitsu/mx532/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml
	
# Other properties see system.prop file

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mx532
PRODUCT_DEVICE := mx532
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)