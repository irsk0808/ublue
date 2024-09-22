#!/bin/bash

### Separate file for this part of the build process. The goal is to unify parts of the build process by making modules that are used across several builds
rpm-ostree install \
gnome-randr-rust \
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
