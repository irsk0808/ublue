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
xhost

### Hardware Codecs
dnf5 -y remove \
gstreamer1-plugins-ugly-free && \
dnf5 -y install \
svt-av1 \
svt-vp9 \
gstreamer1-plugin-openh264 \
gstreamer1-vaapi \
gstreamer-plugins-espeak \
gstreamer1-plugins-ugly

# Replace mutter with package from ublue's copr (disabled till a good one pops up)
# rpm-ostree override replace --experimental \
# --from repo=copr:copr.fedorainfracloud.org:ublue-os:staging \
# mutter \
# mutter-common

# Pop in Bazzite patched stuff
dnf5 -y swap \
--repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib \
pipewire \
pipewire-alsa \
pipewire-gstreamer \
pipewire-jack-audio-connection-kit \
pipewire-jack-audio-connection-kit-libs \
pipewire-libs \
pipewire-pulseaudio \
pipewire-utils \
pipewire-plugin-libcamera \
bluez \
bluez-obexd \
bluez-cups \
bluez-libs \
xorg-x11-server-Xwayland

# Installing FirefoxPWA to save headaches later
rpm --import https://packagecloud.io/filips/FirefoxPWA/gpgkey
echo -e "[firefoxpwa]\nname=FirefoxPWA\nmetadata_expire=300\nbaseurl=https://packagecloud.io/filips/FirefoxPWA/rpm_any/rpm_any/\$basearch\ngpgkey=https://packagecloud.io/filips/FirefoxPWA/gpgkey\nrepo_gpgcheck=1\ngpgcheck=0\nenabled=1" | tee /etc/yum.repos.d/firefoxpwa.repo
dnf5 -y --enable-repo="firefoxpwa"
dnf5 -y install firefoxpwa
