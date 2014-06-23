## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := M532

# Boot Animation
TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/fujitsu/mx532/device_mx532.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mx532
PRODUCT_NAME := cm_mx532
PRODUCT_BRAND := Fujitsu
PRODUCT_MODEL := M532
PRODUCT_MANUFACTURER := Fujitsu

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE=chagall