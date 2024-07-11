# (WIP) Fedora Silverblue but different

This is just a tiny little attempt at creating a version of Fedora Silverblue that for the most part tailored towards my own needs. It uses Universal Blue as a base, and contains some included packages, Nvidia drivers and the fsync kernel. 

At the moment theres only an Asus build.

- To begin, you'll need to switch to the unsigned image to install the
  necessary keys. You can do this by running the following command:

  rpm-ostree rebase ostree-unverified-registry:ghcr.io/clc1101/personalblue:latest

- And then rebooting your system with:

  systemctl reboot

- Afterwards, you can switch to the signed image:

  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/clc1101/personalblue:latest

- And finally, reboot your system again with:

  systemctl reboot
  
Generated using the UBlue Image Template.
