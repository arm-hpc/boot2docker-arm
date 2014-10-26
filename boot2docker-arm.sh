#!/bin/sh
#
# boot2docker-arm.sh - setup a boot2docker image to use binfmt chroots
# 
# Author: Eric Van Hensbergen <ericvh@gmail.com>
#
# NOTE: pass location of where qemu-aarch64-static and qemu-arm-static live
#  (it should be someplace boot2docker already has mounted like $HOME)

QEMUPATH=${1:-$HOME/bin}

sudo cp -f $QEMUPATH/qemu-aarch64-static /usr/bin
sudo cp -f $QEMUPATH/qemu-arm-static /usr/bin
sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
sudo echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:OC' > /proc/sys/fs/binfmt_misc/register
sudo echo ':aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-aarch64-static:OC' > /proc/sys/fs/binfmt_misc/register
