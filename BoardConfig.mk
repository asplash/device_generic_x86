#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true

TARGET_ARCH := x86
TARGET_CPU_ABI := x86
#TARGET_CPU_ABI2 := armeabi
#TARGET_ARCH_VARIANT := x86-atom
TARGET_PRELINK_MODULE := false
TARGET_BOARD_PLATFORM := android-x86
#TARGET_INITRD_SCRIPTS := device/generic/x86/android-x86_info

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

# customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := true
endif

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_BOOTIMAGE_USE_EXT2 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# the following variables could be overridden
TARGET_NO_KERNEL ?= false
TARGET_NO_RECOVERY ?= true
TARGET_PROVIDES_INIT_RC ?= true
TARGET_CPU_SMP ?= true

TARGET_USE_DISKINSTALLER ?= false
#TARGET_DISK_LAYOUT_CONFIG := $(SRC_TARGET_DIR)/board/vbox_x86/disk_layout.conf

BOARD_USES_GENERIC_AUDIO ?= false
BOARD_USES_ALSA_AUDIO ?= true
BUILD_WITH_ALSA_UTILS ?= true
BOARD_HAS_GPS_HARDWARE ?= true

BUILD_EMULATOR ?= false
BUILD_STANDALONE_EMULATOR ?= false
BUILD_EMULATOR_QEMUD ?= false
BUILD_EMULATOR_OPENGL ?= false
BUILD_EMULATOR_QEMU_PROPS ?= false
BUILD_EMULATOR_CAMERA_HAL ?= false
BUILD_EMULATOR_GPS_MODULE ?= false
BUILD_EMULATOR_LIGHTS_MODULE ?= false
BUILD_EMULATOR_SENSORS_MODULE ?= false

USE_OPENGL_RENDERER ?= false

USE_CAMERA_STUB ?= false

# This enables the wpa wireless driver
BOARD_WPA_SUPPLICANT_DRIVER ?= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB ?= private_lib_driver_cmd
WPA_SUPPLICANT_VERSION ?= VER_0_8_X
WIFI_DRIVER_MODULE_PATH ?= auto

#BOARD_GPU_DRIVERS ?= i915 i965 r300g r600g nouveau
BOARD_GPU_DRIVERS ?= i915 i965 swrast r300g r600g vmwgfx
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
BOARD_EGL_CFG ?= device/generic/x86/gpu/egl_mesa.cfg
endif

BOARD_KERNEL_CMDLINE := root=/dev/ram0 androidboot.hardware=$(TARGET_PRODUCT) video=-16
