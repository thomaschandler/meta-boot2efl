inherit gettext

SUMMARY = "Compiles the full CyanogenMod for the SM-T210 tablet and installs only what's needed for libhybris"
HOMEPAGE = "http://forum.xda-developers.com/showthread.php?t=2783617"
LICENSE = "CLOSED"

S = "${WORKDIR}/repo"
B = "${S}"

SRC_URI = "repo://github.com/CyanogenMod/android.git;branch=cm-11.0;manifest=default.xml \
       git://github.com/gr8nole/android_device_samsung_lt02wifi.git;protocol=https;destsuffix=repo/device/samsung/lt02wifi;name=device \
       git://github.com/gr8nole/android_vendor_samsung_lt02wifi.git;protocol=https;destsuffix=repo/vendor/samsung/lt02wifi/;name=vendor \
       git://github.com/gr8nole/android_kernel_samsung_lt02.git;protocol=https;destsuffix=repo/kernel/samsung/lt02/;name=kernel \
	   file://extract-headers.sh \
	   file://bionic-hybris-kitkat-patch"

SRCREV_device = "ead2ddfd661da98c221a891310da7fe5fefc527c"
SRCREV_vendor = "863b0441862b04f8b7026d206a371624d301db4e"
SRCREV_kernel = "2c3a46f2f81aef18758c93297858d689d4d3c4bd"

COMPATIBLE_MACHINE = "sm-t210"
INHIBIT_PACKAGE_STRIP = "1"

PROVIDES += "virtual/android-system-image"
PROVIDES += "virtual/android-headers"

do_compile() {
    bash -c '
    unset STRIP LD STRINGS CC RANLIB CXX FC AS AR CPP OBJCOPY CCLD OBJDUMP NM CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
    . build/envsetup.sh
    vendor/cm/get-prebuilts
    brunch lt02wifi

    patch -d bionic -p1 < ../bionic-hybris-kitkat-patch
    mka bacon '
}

do_install() {
    install -d ${D}/system/
    cp -r out/target/product/lt02wifi/system/* ${D}/system/
    rm -rf ${D}/system/app ${D}/system/fonts ${D}/system/framework ${D}/system/media ${D}/system/preinstall ${D}/system/priv-app ${D}/system/tts

    install -d ${D}${includedir}/android
    ../extract-headers.sh . ${D}${includedir}/android 4 4 2

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
