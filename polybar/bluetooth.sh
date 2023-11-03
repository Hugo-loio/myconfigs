#!/bin/sh

case $1 in 
  open)
    $TERMINAL -e bluetoothctl &
    ;;
  toggle)
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
    then
      notify-send "Bluetooth" "Power on"
      bluetoothctl power on
    else
      notify-send "Bluetooth" "Power off"
      bluetoothctl power off
    fi
    ;;
  *)
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
    then
      echo "%{F#66ffffff}"
      #echo "%{F-}"
    else
      if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
      then 
	echo ""
      fi
      echo "%{F-}"
      #echo "%{F#2193ff}"
    fi
    ;;
esac
