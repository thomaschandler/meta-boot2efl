#FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
#SRC_URI_prepend = " \
#    file://0001-hwcomposer-add-eglfs.patch \
#"
SRCREV = "${AUTOREV}"
DEPENDS += " wayland"
EXTRA_OECONF += " --enable-wayland \
                   --with-default-hybris-ld-library-path=/usr/libexec/droid-hybris/system/lib:/vendor/lib:/system/lib \
                   --enable-property-cache"

COMPATIBLE_MACHINE = "(hammerhead)"

