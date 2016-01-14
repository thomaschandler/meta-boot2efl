FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
# Android has it's firmware binaries in different directories so we're adding them as
# search paths for the systemd firmware loader too
EXTRA_OECONF += " \
    --with-firmware-path=/lib/firmware/updates:/lib/firmware:/system/etc/firmware:/etc/firmware:/vendor/firmware:/firmware/image \
    "

SRC_URI += " \
    file://997-droid-drm.rules                      \
    file://998-droid-system.rules                   \
    file://999-android-system.rules                 \
    file://999-bluetooth.rules                      \
    file://999-extra-rules.rules                    \
"

do_install_append(){
    install -d ${D}${base_libdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/997-droid-drm.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/998-droid-system.rules                  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-android-system.rules                ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-bluetooth.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-extra-rules.rules                   ${D}${base_libdir}/udev/rules.d/
}

FILES_udev += " ${base_libdir}/udev"
