#!/bin/bash

### Separate file for this part of the build process. The goal is to unify parts of the build process by making modules that are used across several builds
rpm-ostree install \
gnome-randr-rust \
gnome-monitor-config \
polkit \
neofetch \
fastfetch \
cowsay \
grub-customizer \
gnome-tweaks \
distrobox \
yt-dlp \
zlib \
xcb-util-cursor \
i2c-tools

# Pop in Valve's patched stuff
rpm-ostree override replace --experimental \
--from repo=copr:copr.fedorainfracloud.org:kylegospo:bazzite-multilib \
mesa-filesystem \
mesa-libxatracker \
mesa-libglapi \
mesa-dri-drivers \
mesa-libgbm \
mesa-libEGL \
mesa-vulkan-drivers \
mesa-libGL \
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
