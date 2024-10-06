#!/bin/bash

# New file dedicated just for media acceleration, because the amount of gstreamer packages I was adding became excessive
rpm-ostree install \
svt-av1 \
svt-vp9 \
gstreamer1-vaapi \
#gstreamer1-plugin-openh264 \
gstreamer1-plugins-bad-free-opencv \
#gstreamer1-plugins-bad-free-libs \
gstreamer1-plugins-bad-free-extras \
gstreamer1-plugin-gtk4 \
#gstreamer1-plugins-ugly-free \
gstreamer1-plugins-ugly \
gstreamer1-plugins-bad-freeworld \
gstreamer1-libav \
gstreamer-plugins-espeak
#gstreamer-plugins-espeak \
#gstreamer-ffmpeg \
#gstreamer-plugins-ugly \
#gstreamer-plugins-bad
