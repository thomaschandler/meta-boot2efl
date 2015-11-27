SUMMARY = "android hal"
COMPATIBLE_MACHINE = "hammerhead"
LICENSE = "CLOSED"

PR = "r1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit systemd

SRC_URI = "file://android-hal.tar.xz \
           file://droid-hal-init.service \
           file://droid-hal-startup.sh \
           file://droid-init-done.sh \
           file://999-android-system.rules \
           file://firmware.mount \
           file://mnt-asec.mount \
           file://mnt-fuse.mount \
           file://mnt-obb.mount \
           file://persist.mount \
           file://sys-fs-pstore.mount \
           file://system.mount \
"

MOUNT_UNITS = "firmware mnt-asec mnt-fuse mnt-obb persist sys-fs-pstore system"

do_install () {
    cp -r ${WORKDIR}/root/* ${D}

    install -d ${D}/sbin
    mv ${D}/init ${D}/sbin/droid-hal-init
    install -d ${D}/usr/libexec
    install -d ${D}/usr/libexec/droid-hybris
    cp -r ${WORKDIR}/system ${D}/usr/libexec/droid-hybris

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/droid-hal-init.service ${D}${systemd_unitdir}/system


    install -d ${D}${sysconfdir}/systemd/
    install -d ${D}${sysconfdir}/systemd/basic.target.wants
    ln -sf ${systemd_unitdir}/system/droid-hal-init.service ${D}${sysconfdir}/systemd/system/basic.target.wants/$mount.mount

    install -d ${D}${bindir}/droid
    install -m 0644 ${WORKDIR}/droid-hal-startup.sh ${D}${bindir}/droid
    install -m 0644 ${WORKDIR}/droid-init-done.sh ${D}${bindir}/droid

    install -d ${D}${sysconfdir}/systemd/local-fs.target.wants

    for mount in ${MOUNT_UNITS} ; do
        install -m 0644 ${WORKDIR}/$mount.mount ${D}${systemd_unitdir}/system
        ln -sf ${systemd_unitdir}/system/$mount.mount ${D}${sysconfdir}/systemd/local-fs.target.wants/$mount.mount
    done

}

# elf binaries without GNU_HASH and we cannot fix it
INSANE_SKIP_${PN} = "ldflags"
# Already stripped and we cannot fix it, this will hide a lot of warnings about files already stripped
INHIBIT_PACKAGE_STRIP = "1"

FILES_${PN} = " / /usr/libexec/droid-hybris ${systemd_unitdir}/system ${bindir}/droid"

SYSTEMD_SERVICE_${PN} = "droid-hal-init.service"
