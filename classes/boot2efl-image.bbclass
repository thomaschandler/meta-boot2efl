# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += "package-management ssh-server-openssh splash hwcodecs"

# NETWORK
IMAGE_INSTALL += "connman"
IMAGE_INSTALL += "connman-client"
IMAGE_INSTALL += "iw wireless-tools"
IMAGE_INSTALL += "avahi-daemon"
IMAGE_INSTALL += "bash"

# Utils
IMAGE_INSTALL += "less iotop procps htop"
IMAGE_INSTALL += "nano vim tzdata coreutils bash file findutils gawk grep psmisc sed util-linux sudo module-init-tools wget net-tools nano logrotate tar zlib gzip bzip2"

# EFL
IMAGE_INSTALL += "e-wm expedite liberation-fonts elementary-tests"

# Boot2EFL specific packages
IMAGE_INSTALL += "packagegroup-boot2efl"

