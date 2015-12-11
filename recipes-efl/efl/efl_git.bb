require ${BPN}.inc

SRC_URI = "\
    git://git.projects.openwide.fr/open-wide/efl-hybris-efl.git,branch=devs/cbenier/eglfs;protocole=ssh \
"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"

# Temporary disable until error like the one following are fixed
# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
# collect2: error: ld returned 1 exit status
# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
PARALLEL_MAKE_class-native = ""

#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
#Makefile:2163: recipe for target 'all-recursive' failed
# autotools-brokensep
B = "${S}"

EXTRA_OECONF_append_class-target = " --enable-wayland --disable-drm --disable-drm-hw-accel --with-x11=none --without-x --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba BUILD_ENGINE_GL_DRM_FALSE='#' EVAS_STATIC_BUILD_GL_DRM_FALSE='#' BUILD_ECORE_EVAS_GL_DRM_FALSE='#'"

DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff fontconfig libfribidi giflib udev efl-native util-linux wayland libxkbcommon android-headers-hammerhead"
DEPENDS_class-native = "freetype-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"

RDEPENDS_ecore = "ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-evas"
