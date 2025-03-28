#! /bin/sh

# load keyboard layout
setxkbmap de deadacute

# go to a workspace that is not used by autostart applications to avoid wrong workspace name
i3-msg "workspace 0"

# load i3 layout
i3-msg "append_layout $HOME/.i3/layout.json"

# load applications
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
pamac-tray &
thunderbird &
firefox &
alacritty -e tmux &
XDG_CURRENT_DESKTOP=kde dolphin &
