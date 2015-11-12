inherit core-image
LICENSE = "GPL-2.0"

IMAGE_FEATURES += "splash package-management ssh-server-dropbear"
 
IMAGE_INSTALL += "base-files base-passwd shadow tzdata coreutils bash file findutils gawk grep procps psmisc sed util-linux sudo module-init-tools wget net-tools nano less logrotate tar zlib gzip bzip2 connman liberation-fonts e-wm expedite"

IMAGE_INSTALL += "packagegroup-boot2efl"
