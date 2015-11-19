SUMMARY = "android hal"
COMPATIBLE_MACHINE = "hammerhead"
LICENSE = "GPL2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://android-hal.tar.xz \
           file://droid-hal-init.service \
           file://droid-hal-startup.sh "

PROVIDES = "android-hal"

do_install () {
    cp -r ${WORKDIR}/root/* ${D}
    install -d ${D}/usr/libexec
    install -d ${D}/usr/libexec/droid-hybris
    cp -r ${WORKDIR}/system ${D}/usr/libexec/droid-hybris
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/droid-hal-init.service ${D}${systemd_unitdir}/system
    install -d ${D}${bindir}/droid
    install -m 0644 ${WORKDIR}/droid-hal-startup.sh ${D}${bindir}/droid
}

FILES_${PN} = " / /usr/libexec/droid-hybris ${systemd_unitdir}/system ${bindir}/droid"
