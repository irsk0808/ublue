#!/bin/bash

# Laptop specific extensions
# Hide Top Bar
wget -P /tmp https://extensions.gnome.org/extension-data/hidetopbarmathieu.bidon.ca.v118.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/hidetopbarmathieu.bidon.ca.v118.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Wallpaper Slideshow
wget -P /tmp https://extensions.gnome.org/extension-data/azwallpaperazwallpaper.gitlab.com.v10.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/azwallpaperazwallpaper.gitlab.com.v10.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir
