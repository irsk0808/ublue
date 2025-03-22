#!/usr/bin/bash

echo "Installing Bazzite Kernel!"

dnf5 -y remove --no-autoremove \
    kernel \
    kernel-core \
    kernel-modules \
    kernel-modules-core \
    kernel-modules-extra

dnf5 -y install \
    /tmp/kernel-rpms/kernel-[0-9]*.rpm \
    /tmp/kernel-rpms/kernel-core-*.rpm \
    /tmp/kernel-rpms/kernel-modules-*.rpm \
    /tmp/kernel-rpms/kernel-uki-virt-*.rpm \
    /tmp/kernel-rpms/kernel-devel-*.rpm

dnf5 -y install scx-scheds && systemctl enable scx
    
echo "Installing kmod packages!"

dnf5 -y install /tmp/akmods-rpms/kmods/kmod-xpadneo*.rpm
dnf5 -y install /tmp/akmods-rpms/kmods/kmod-xone*.rpm
