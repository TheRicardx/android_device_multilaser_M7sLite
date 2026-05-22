#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from ML-SO06-M7sLite device
$(call inherit-product, device/multilaser/ML-SO06-M7sLite/device.mk)

PRODUCT_DEVICE := ML-SO06-M7sLite
PRODUCT_NAME := omni_ML-SO06-M7sLite
PRODUCT_BRAND := Multilaser
PRODUCT_MODEL := M7sLite
PRODUCT_MANUFACTURER := multilaser

PRODUCT_GMS_CLIENTID_BASE := android-multilaser

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="M7sLite-user 8.1.0 V18_20211220 18 release-keys"

BUILD_FINGERPRINT := Multilaser/M7sLite/ML-SO06-M7sLite:8.1.0/V18_20211220/18:user/release-keys
