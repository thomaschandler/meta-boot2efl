# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

# Fix for kernel-abiversion missing
# https://lists.yoctoproject.org/pipermail/yocto/2015-June/025322.html
# TODO: Build kernel for crespo as layer
USE_DEPMOD = "0"

IMAGE_FEATURES += "package-management ssh-server-openssh splash hwcodecs"

