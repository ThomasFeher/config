#! /bin/sh

# go to a workspace that is not used by autostart applications to avoid wrong workspace name
i3-msg "workspace 0"

# load i3 layout
i3-msg "append_layout $HOME/.i3/layout.json"

# load applications
thunderbird &
firefox &
alacritty -e screen &
dolphin &
weechat &
SpiderOak &
