#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
 killall -q polybar

# Add PATH
export PATH=$HOME/.local/bin:$PATH
export THEME_MODE=$(cat ~/.config/theme_mode)



case "$THEME_MODE" in
    dark)
        cp -f  ~/.config/polybar/polybar_dark_mode.txt ~/.config/polybar/colors.ini
        ;;
    light)
        cp -f ~/.config/polybar/polybar_light_mode.txt ~/.config/polybar/colors.ini
        ;;
    *)
        echo "Invalid THEME_MODE value or THEME_MODE not set. Defaulting to dark mode."
        cp -f  ~/.config/polybar/polybar_dark_mode.txt ~/.config/polybar/colors.ini
        ;;
esac

# Launch bar
echo "---" | tee -a /tmp/polybar_top.log
polybar top 2>&1 | tee -a /tmp/polybar_top.log & disown

echo "Bars launched..."
