require ${BPN}.inc

SRC_URI = "\
    git://git.enlightenment.org/core/elementary.git;protocol=http \
"

SRCREV = "${AUTOREV}"
S =  "${WORKDIR}/git"

# only for target, because configure doesn't default to sane default when
# these paths aren't passed in -native build
SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"

# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
B = "${S}"
