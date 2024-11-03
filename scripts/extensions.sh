#!/bin/bash

# Someday I'll find a better solution, but this is still better than manually injecting extension files
# Blur my shell
wget -P /tmp https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v67.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/blur-my-shellaunetx.v67.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# User themes
wget -P /tmp https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v59.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/user-themegnome-shell-extensions.gcampax.github.com.v59.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Rounded window corners
#wget -P /tmp https://extensions.gnome.org/extension-data/rounded-window-cornersfxgn.v3.shell-extension.zip
#unzip -d /tmp/tmpdir /tmp/rounded-window-cornersfxgn.v3.shell-extension.zip
#UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
#cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
#glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
#rm -r /tmp/tmpdir

# Appindicator
wget -P /tmp https://extensions.gnome.org/extension-data/appindicatorsupportrgcjonas.gmail.com.v59.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/appindicatorsupportrgcjonas.gmail.com.v59.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Fullscreen avoider
wget -P /tmp https://extensions.gnome.org/extension-data/fullscreen-avoidernoobsai.github.com.v13.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/fullscreen-avoidernoobsai.github.com.v13.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Grand Theft Focus
wget -P /tmp https://extensions.gnome.org/extension-data/grand-theft-focuszalckos.github.com.v7.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/grand-theft-focuszalckos.github.com.v7.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Legacy scheme auto switcher
wget -P /tmp https://extensions.gnome.org/extension-data/legacyschemeautoswitcherjoshimukul29.gmail.com.v9.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/legacyschemeautoswitcherjoshimukul29.gmail.com.v9.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Light style
wget -P /tmp https://extensions.gnome.org/extension-data/light-stylegnome-shell-extensions.gcampax.github.com.v7.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/light-stylegnome-shell-extensions.gcampax.github.com.v7.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod 755 /usr/share/gnome-shell/extensions/${UUID}/metadata.json
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir

# Quick settings audio panel
wget -P /tmp https://extensions.gnome.org/extension-data/quick-settings-audio-panelrayzeq.github.io.v68.shell-extension.zip
unzip -d /tmp/tmpdir /tmp/quick-settings-audio-panelrayzeq.github.io.v68.shell-extension.zip
UUID=$(jq -r '.["uuid"]' < '/tmp/tmpdir/metadata.json')
cp -r tmp/tmpdir /usr/share/gnome-shell/extensions/${UUID} && chmod -R 755 /usr/share/gnome-shell/extensions/${UUID}
glib-compile-schemas /usr/share/gnome-shell/extensions/${UUID}/schemas/
rm -r /tmp/tmpdir
