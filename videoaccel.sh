#!/bin/bash

# New file dedicated just for media acceleration
rpm-ostree install \
  gstreamer \
  gstreamer-plugins-base \
  gstreamer-plugins-ugly \
  gstreamer-plugins-espeak \
  gstreamer-ffmpeg \
  svt-av1 \
  svt-av1-libs \
  svt-vp9 \
  svt-vp9-libs \
  gstreamer1-vaapi \
  gstreamer1-plugin-openh264 \
  gstreamer1-plugins-bad-free-opencv \
  gstreamer1-plugins-bad-free-libs \
  gstreamer1-plugins-bad-free-extras \
  gstreamer1-plugins-bad-nonfree \
  gstreamer1-plugin-gtk4 \
  gstreamer1-plugins-ugly-free \
  gstreamer1-plugins-bad-freeworld \
  gstreamer1-libav && \
