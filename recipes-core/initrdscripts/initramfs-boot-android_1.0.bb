DESCRIPTION = "Simple init script to boot on an Android device"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI = " \
  file://init.sh"

PACKAGES = "${PN}"
FILES_${PN} = "/init"

do_install() {
    install -m 0755 ${WORKDIR}/init.sh ${D}/init
}
