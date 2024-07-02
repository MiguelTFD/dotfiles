#!/usr/bin/env sh

killall -q polybar 

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

export PATH=$HOME/.local/bin:$PATH

config location ~/.config/polybar/config
polybar -l info bar >> /tmp/polybar.log 2>&1 &


echo "Polybar launched with env PATH=$PATH" >> /tmp/polybar_launch.log 
