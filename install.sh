#!/bin/bash

echo "installation"

apt -y install curl chromium-browser

# Only for mutter (Wayland)
#gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"


