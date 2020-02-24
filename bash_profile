#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile ]] && . ~/.profile

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  read -p "Please select WM/DE (default is bspwm)" session
  echo "bash: " $session >> ~/.test
  exec startx ~/.xinitrc $session
fi
