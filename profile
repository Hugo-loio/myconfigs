XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
export PATH="$PATH:$HOME/scripts"
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="firefox"
export FILE="ranger"
export MONITOR="eDP1"

if systemctl -q is-active graphical.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
  #  echo "Please select WM/DE (default is bspwm)"
  #  read session
  #  exec startx ~/.xinitrc $session
  exec startx
fi

