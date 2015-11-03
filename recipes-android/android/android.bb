inherit gettext

SUMMARY = "Compiles the full CyanogenMod for the Hammerhead LG Nexus 5 and installs only what's needed for libhybris"
HOMEPAGE = "https://wiki.cyanogenmod.org/w/Build_for_hammerhead"
LICENSE = "CLOSED"

S = "${WORKDIR}"
B = "${S}"

SRC_URI = "file://android_headers.tar.xz \
       	   file://system.tar.xz"

COMPATIBLE_MACHINE = "(hammerhead)"
INHIBIT_PACKAGE_STRIP = "1"

PROVIDES += "virtual/android-system-image"
PROVIDES += "virtual/android-headers"


do_install() {
    install -d ${D}/system/
    cp -r ${S}/system/* ${D}/system/
    rm -rf ${D}/system/app ${D}/system/fonts ${D}/system/framework ${D}/system/media ${D}/system/preinstall ${D}/system/priv-app ${D}/system/tts

    install -d ${D}${includedir}/android
    cp -r ${S}/android_headers/* ${D}${includedir}/android

    install -d ${D}${libdir}/pkgconfig
    install -m 0644 ${D}${includedir}/android/android-headers.pc ${D}${libdir}/pkgconfig
    rm ${D}${includedir}/android/android-headers.pc
}

# Inhibit Quality Assurance which is not suited for our /system
do_qa() {
}

do_package_qa() {
}

FILES_${PN} = "/system ${libdir}/pkgconfig ${includedir}/android /etc /lib"
