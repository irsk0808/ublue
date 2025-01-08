#!/bin/bash

### Separate file for this part of the build process. The goal is to unify parts of the build process by making modules that are used across several builds
rpm-ostree install \
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

# Replace mutter with a patched one
rpm-ostree override replace --experimental \
--from repo=copr:copr.fedorainfracloud.org:gloriouseggroll:nobara-41 \
mutter

# Pop in Bazzite patched stuff
rpm-ostree override replace --experimental \
--from repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib \
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
echo -e "[firefoxpwa]\nname=FirefoxPWA\nmetadata_expire=300\nbaseurl=https://packagecloud.io/filips/FirefoxPWA/rpm_any/rpm_any/\$basearch\ngpgkey=https://packagecloud.io/filips/FirefoxPWA/gpgkey\nrepo_gpgcheck=1\ngpgcheck=0\nenabled=1" | sudo tee /etc/yum.repos.d/firefoxpwa.repo
rpm-ostree --enablerepo="firefoxpwa"
rpm-ostree install firefoxpwa
