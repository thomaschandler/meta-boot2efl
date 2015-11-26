require recipes-kernel/linux/linux.inc

SUMMARY = "Android kernel for the hammerhead Nexus 5 phone"
SECTION = "kernel"

COMPATIBLE_MACHINE = "hammerhead"

DESCRIPTION = "Linux kernel for the LG Nexus 5 (Hammerhead) device"

KERNEL_RAM_BASE = "0x00008000"
RAMDISK_RAM_BASE = "0x02900000"
SECOND_RAM_BASE = "0x00f00000"
TAGS_RAM_BASE = "0x02700000"

CMDLINE = "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1"

inherit kernel_android

SRC_URI = " \
  git://github.com/CyanogenMod/android_kernel_lge_hammerhead.git;branch=stable/cm-11.0 \
  file://0001-Fix-build-with-gcc-5.x.patch \
  file://defconfig \
"

SRCREV = "03909e9ff9f91a6285af67845756ecd67391341f"

S = "${WORKDIR}/git"
PV = "3.4.0"
