#!/bin/bash

### Separate file for this part of the build process. The goal is to unify parts of the build process by making modules that are used across several builds
dnf5 -y install \
gnome-randr-rust \
gnome-monitor-config \
fastfetch \
cowsay \
grub-customizer \
gnome-tweaks \
distrobox \
yt-dlp \
zlib \
xcb-util-cursor \
i2c-tools \
libnsl \
podman \
powertop \
steam-devices \
google-noto-fonts-all \
rsms-inter-fonts \
xhost \
adw-gtk3-theme \
firewall-config

# Media plugins
dnf5 -y install \
svt-av1 \
svt-vp9 \
gstreamer1-plugin-openh264 \
gstreamer1-vaapi \
gstreamer-plugins-espeak \
gstreamer1-plugins-ugly \
mesa-vdpau-drivers.x86_64 \
mesa-vdpau-drivers.i686

# Custom mutter with triple buffering patch
dnf5 -y swap --repo=copr:copr.fedorainfracloud.org:trixieua:mutter-patched mutter mutter

# Pop in Bazzite patched stuff
dnf5 -y swap --repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib pipewire pipewire
dnf5 -y swap --repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib bluez bluez
dnf5 -y swap --repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib xorg-x11-server-Xwayland xorg-x11-server-Xwayland

# Installing FirefoxPWA to save headaches later
rpm --import https://packagecloud.io/filips/FirefoxPWA/gpgkey
echo -e "[firefoxpwa]\nname=FirefoxPWA\nmetadata_expire=7d\nbaseurl=https://packagecloud.io/filips/FirefoxPWA/rpm_any/rpm_any/\$basearch\ngpgkey=https://packagecloud.io/filips/FirefoxPWA/gpgkey\nrepo_gpgcheck=1\ngpgcheck=0\nenabled=1" | tee /etc/yum.repos.d/firefoxpwa.repo
dnf5 --enable-repo="firefoxpwa"
dnf5 -y install firefoxpwa
