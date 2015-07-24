# Use custom sources
SRC_URI = " \
    git://github.com/FlorentRevest/Enlightenment;protocol=https \
    file://0001-configure.ac-add-foreign.patch \
    file://enlightenment_start.oe \
    file://applications.menu \
"
SRCREV = "${AUTOREV}"
PV = "git"

# Removes X11 forced dependencies
DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary"

EXTRA_OECONF = "\
    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
    --with-eldbus_codegen=${STAGING_BINDIR_NATIVE}/eldbus-codegen"

RDEPENDS_${PN} = "\
    shared-mime-info \
    mime-support \
    edje-utils \
    ${PN}-utils \
"

# Makes wayland and x11 optional
PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
PACKAGECONFIG[wayland] = "--enable-wayland --enable-wayland-egl --enable-wl-desktop-shell,--disable-wayland --disable-wayland-egl --disable-wl-desktop-shell,wayland virtual/libgles2 xkeyboard-config"
PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR}/X11 --x-libraries=${STAGING_LIBDIR} --enable-simple-x11,--disable-simple-x11 --disable-wl-x11 --disable-xwayland --disable-shot,libxcb libxcb"

# Enable eglfs module
EXTRA_OECONF += "--enable-wl-eglfs"
