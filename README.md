boot2docker-arm
===============

This script lets you setup a boot2docker virtual machine so that it can boot binfmt-chroot ARM docker images.  You need to have a qemu-arm-static and/or a qemu-aarch64-static binary pre-built or grabbed from an existing Linux installation.  I put mine in $HOME/bin which is available to boot2docker on OSX.  You can override this path via a command line argument to the script.  Otherwise, I believe its self-explanatory.

Once you have this setup, you can copy the qemu-*-static into /usr/bin in any ARM docker image and boot it on x86.  There are also some pre-baked docker images in my hub.docker.com:
  * ericvh/arm64-ubuntu
  * ericvh/arm64-ubuntu-dev
  * ericvh/arm64-ubuntu-hpc
  
I haven't tried to rig boot2docker to autorun this script, so it needs to be done anytime the VM image is updated.
