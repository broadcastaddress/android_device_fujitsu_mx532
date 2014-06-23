#
# Copyright (C) 2014 Marcus Sonntag
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# See https://code.google.com/p/broadcom-bluetooth

ifeq ($(BOARD_HAVE_BLUETOOTH_BCM),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	brcm_patchram_plus.c

#LOCAL_C_INCLUDES := 

LOCAL_SHARED_LIBRARIES := libcutils liblog

LOCAL_C_FLAGS := \
    -DANDROID

LOCAL_MODULE := brcm_patchram_plus

include $(BUILD_EXECUTABLE)

endif
