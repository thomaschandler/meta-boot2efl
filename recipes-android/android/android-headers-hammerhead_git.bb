require recipes-android/android-headers/android-headers.inc

PV = "5.1.1"

SRC_URI = "file://android-headers.tar.xz"

S="${WORKDIR}/android-headers/"

COMPATIBLE_MACHINE = "hammerhead"

do_configure() {
}
