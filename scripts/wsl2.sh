#!/bin/bash

podman network create --internal gitkraken_internal
mkdir -p $HOME/.gitkraken
podman run -d -it --privileged=true --rm -v /mnt/wslg/.X11-unix:/tmp/.X11-unix\
               -v /mnt/wslg:/mnt/wslg\
               -v $HOME/github:/root/github\
               -v $HOME/.gitconfig:/root/.gitconfig\
               -v $HOME/.gitkraken:/root/.gitkraken\
               -v $HOME/.config:/root/.config\
               -e DISPLAY=$DISPLAY\
               -e WAYLAND_DISPLAY=wayland-0\
               -e XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir\
               -e PULSE_SERVER=unix:/mnt/wslg/PulseServer\
               --network gitkraken_internal\
               ghcr.io/whynotea/gitkraken:latest /usr/share/gitkraken/gitkraken --no-sandbox --disable-gpu
