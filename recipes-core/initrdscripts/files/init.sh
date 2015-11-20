#! /bin/sh

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

echo "Mounting relevant filesystems ..."

mount -t proc proc /proc -o nosuid,noexec,nodev
mount -t sysfs sys /sys -o nosuid,noexec,nodev
mount -t devtmpfs dev /dev -o mode=0755,nosuid

mkdir -m 0777 /dev/block
for i in {0..28} ; do 
    mknod -m 0666 /dev/block/mmcblk0p$i b 179 $i
done

echo "255" > "/sys/class/leds/led:flash_torch/brightness"

info() {
    echo "$1" > /dev/ttyprintk
    echo "$1" > /dev/kmsg
}

fail() {
    echo "Failed" > /dev/ttyprintk
    echo "$1" > /dev/ttyprintk
    echo "$1" > /dev/kmsg
    echo "Waiting for 15 seconds before rebooting ..." > /dev/ttyprintk
    sleep 15s
    reboot
}

mkdir /rfs
sdcard_partition="block/mmcblk0p28"
info "Mounting sdcard/nand ... "
mkdir -m 0777 /d
mount -t auto -o rw,noatime,nodiratime /dev/$sdcard_partition /d
[ $? -eq 0 ] || fail "Failed to mount the sdcard/nand Cannot continue."
info "Rootfs folder found at /d/linux/rootfs; chrooting into ..."
mount -o bind,rw /d/media/0/linux/rootfs /rfs
[ $? -eq 0 ] || fail "Failed to mount /rootfs"
info "Switching to rootfs..."
echo "0" > "/sys/class/leds/led:flash_torch/brightness"
umount /dev
umount /sys
umount /proc
exec switch_root /rfs /sbin/init &> /rfs/init-stderrout
[ $? -eq 0 ] || fail "Failed to launch init"
