# (WIP) Fedora Silverblue but different

This is just a tiny little attempt at creating a version of Fedora Silverblue that's for the most part tailored towards my own needs. It uses Universal Blue as a base, and contains some included packages, Nvidia drivers and the fsync kernel. 

Desktop build unfinished! For secure boot support, enroll Ublue's MOK keys.

- First, rebase with unsigned image:

  rpm-ostree rebase ostree-unverified-registry:ghcr.io/clc1101/personalblue-desktop:latest

- Reboot:

  systemctl reboot

- Then, you can rebase to the signed image:

  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/clc1101/personalblue-desktop:latest

- Reboot again:

  systemctl reboot

Apologies in advance if this is poorly put together. I'm an artist, not a programmer.
