#!/usr/bin/env sh

killall -q polybar 

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Agrege esta linea, para asi hacer referencia los scripts de bin
export PATH=$HOME/.local/bin:$PATH

config location ~/.config/polybar/config
polybar -l info bar >> /tmp/polybar.log 2>&1 &


echo "Polybar launched with env PATH=$PATH" >> /tmp/polybar_launch.log 
