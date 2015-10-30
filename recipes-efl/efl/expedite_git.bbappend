# Use last revision of git
SRCREV = "${AUTOREV}"
PV = "git"
S="${WORKDIR}/git"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://0001-Fix-build.patch "

# And remove X11 Dependencies
EXTRA_OECONF = ""
RDEPENDS_${PN} = "expedite-themes"
