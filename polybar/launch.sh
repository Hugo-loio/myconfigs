#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
  for m in $(xrandr --query | grep -w "connected" | cut -d " " -f 1); do
    notify-send "Monitor $m" "Making polybar"
    t=""
    if [ -z $(xrandr | grep "$m" | grep "primary") ] ; then
      t=""
    else
      t="right"
    fi
    monitor=$m tray=$t polybar mybar &
  done
else
  polybar mybar &
fi

echo "Polybar launched..."
