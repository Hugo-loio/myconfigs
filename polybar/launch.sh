#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get color theme to use
bgcolor=$(grep polybar_bgcolor $CACHE/theme.txt | cut -d= -f2)
fgcolor=$(grep polybar_fgcolor $CACHE/theme.txt | cut -d= -f2)

bl_card=$(ls /sys/class/backlight || echo "")

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
  for m in $(xrandr --query | grep -w "connected" | cut -d " " -f 1); do
    notify-send "Monitor $m" "Making polybar"
    if [ -z "$(xrandr | grep "$m" | grep "primary")" ] ; then
      monitor=$m bg=$bgcolor fg=$fgcolor card=$bl_card polybar secondary &
    else
      monitor=$m bg=$bgcolor fg=$fgcolor card=$bl_card polybar main &
    fi
  done
else
  polybar main &
fi

echo "Polybar launched..."
