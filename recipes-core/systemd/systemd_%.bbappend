FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
# Android has it's firmware binaries in different directories so we're adding them as
# search paths for the systemd firmware loader too
EXTRA_OECONF += " \
    --with-firmware-path=/lib/firmware/updates:/lib/firmware:/system/etc/firmware:/etc/firmware:/vendor/firmware:/firmware/image"

SRC_URI += " \
    file://platform-device \
    file://42-usb-hid-pm.rules                      \
    file://50-firmware.rules                        \
    file://50-udev-default.rules                    \
    file://60-cdrom_id.rules                        \
    file://60-drm.rules                             \
    file://60-keyboard.rules                        \
    file://60-persistent-alsa.rules                 \
    file://60-persistent-input.rules                \
    file://60-persistent-serial.rules               \
    file://60-persistent-storage-tape.rules         \
    file://60-persistent-storage.rules              \
    file://60-persistent-v4l.rules                  \
    file://61-accelerometer.rules                   \
    file://64-btrfs.rules                           \
    file://65-android.rules                         \
    file://70-mouse.rules                           \
    file://70-power-switch.rules                    \
    file://70-touchpad.rules                        \
    file://70-uaccess.rules                         \
    file://71-seat.rules                            \
    file://73-seat-late.rules                       \
    file://75-net-description.rules                 \
    file://75-probe_mtd.rules                       \
    file://75-tty-description.rules                 \
    file://78-sound-card.rules                      \
    file://80-drivers.rules                         \
    file://80-net-setup-link.rules                  \
    file://85-regulatory.rules                      \
    file://90-alsa-restore.rules                    \
    file://90-pulseaudio.rules                      \
    file://90-vconsole.rules                        \
    file://95-keyboard-force-release.rules          \
    file://95-keymap.rules                          \
    file://95-udev-late.rules                       \
    file://95-upower-battery-recall-dell.rules      \
    file://95-upower-battery-recall-fujitsu.rules   \
    file://95-upower-battery-recall-gateway.rules   \
    file://95-upower-battery-recall-ibm.rules       \
    file://95-upower-battery-recall-lenovo.rules    \
    file://95-upower-battery-recall-toshiba.rules   \
    file://95-upower-csr.rules                      \
    file://95-upower-hid.rules                      \
    file://95-upower-wup.rules                      \
    file://97-bluetooth-hid2hci.rules               \
    file://97-hid2hci.rules                         \
    file://99-fuse.rules                            \
    file://99-systemd.rules                         \
    file://997-droid-drm.rules                      \
    file://998-droid-system.rules                   \
    file://999-android-system.rules                 \
    file://999-bluetooth.rules                      \
    file://999-extra-rules.rules                    \
"

do_install_append(){
    install -d ${D}${base_libdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/platform-device ${D}${base_libdir}/udev/

    install -m 0644 ${WORKDIR}/42-usb-hid-pm.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/50-firmware.rules                       ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/50-udev-default.rules                   ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-cdrom_id.rules                       ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-drm.rules                            ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-keyboard.rules                       ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-alsa.rules                ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-input.rules               ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-serial.rules              ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-storage-tape.rules        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-storage.rules             ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/60-persistent-v4l.rules                 ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/61-accelerometer.rules                  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/64-btrfs.rules                          ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/65-android.rules                        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/70-mouse.rules                          ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/70-power-switch.rules                   ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/70-touchpad.rules                       ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/70-uaccess.rules                        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/71-seat.rules                           ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/73-seat-late.rules                      ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/75-net-description.rules                ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/75-probe_mtd.rules                      ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/75-tty-description.rules                ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/78-sound-card.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/80-drivers.rules                        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/80-net-setup-link.rules                 ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/85-regulatory.rules                     ${D}${base_libdir}/udev/rules.d/
    #install -m 0644 ${WORKDIR}/90-alsa-restore.rules                   ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/90-pulseaudio.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/90-vconsole.rules                       ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-keyboard-force-release.rules         ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-keymap.rules                         ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-udev-late.rules                      ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-dell.rules     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-fujitsu.rules  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-gateway.rules  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-ibm.rules      ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-lenovo.rules   ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-battery-recall-toshiba.rules  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-csr.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-hid.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/95-upower-wup.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/97-bluetooth-hid2hci.rules              ${D}${base_libdir}/udev/rules.d/
    #install -m 0644 ${WORKDIR}/97-hid2hci.rules                        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/99-fuse.rules                           ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/99-systemd.rules                        ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/997-droid-drm.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/998-droid-system.rules                  ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-android-system.rules                ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-bluetooth.rules                     ${D}${base_libdir}/udev/rules.d/
    install -m 0644 ${WORKDIR}/999-extra-rules.rules                   ${D}${base_libdir}/udev/rules.d/
}
