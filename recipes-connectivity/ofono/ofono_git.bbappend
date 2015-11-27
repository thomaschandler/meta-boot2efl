SRCREV = "b6576cfcc07293f425d5a96495a6a9e8689b7728"

PV = "git"

B = "${S}"

RDEPENDS_${PN} = "\
               python3 \
               python3-codecs \
               python3-math \
               python3-io \
               python3-misc \
"

do_install_append() {
                    # Because python3-dbus module is currently not there, just use
                    # python 2.x in the ofono test scripts
                    for PYTHSCRIPT in `grep -rIl ${bindir}/python3 ${D}${libdir}/${PN}`; do
                        sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
                        done
}

do_configure_prepend () {
    pushd .
    cd ${S}
    ./bootstrap
    popd
}

