require recipes-kernel/linux/linux.inc

SUMMARY = "Android kernel for the Radxa Rock board"
SECTION = "kernel"

COMPATIBLE_MACHINE = "hammerhead"

DESCRIPTION = "Linux kernel for the Samsung SM-T210 device based on the offical \
source from Samsung"

KERNEL_RAM_BASE = "0x00008000"
RAMDISK_RAM_BASE = "0x02900000"
SECOND_RAM_BASE = "0x00f00000"
TAGS_RAM_BASE = "0x02700000"

CMDLINE = "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead  user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1"

inherit kernel_android

SRC_URI = " \
  git://android.googlesource.com/kernel/msm.git;protocol=https;branch=android-msm-hammerhead-3.4-lollipop-mr1.1 \
  file://0001-Fix-build-with-gcc-5.x.patch \
  file://defconfig \
"

SRCREV = "0315133ea8bc6f8126d1f86fd727d6964007351b"

S = "${WORKDIR}/git"
PV = "3.4.0"
