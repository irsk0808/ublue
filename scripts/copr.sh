#!/usr/bin/bash

# Modularizing the Copr instructions here too to make my life easier
dnf5 -y copr enable fiftydinar/gnome-randr-rust
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable kylegospo/bazzite-multilib
dnf5 -y copr enable trixieua/mutter-patched
