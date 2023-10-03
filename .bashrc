# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

# avoid duplicates in bash history
export HISTCONTROL=ignoredups:erasedups

test -s ~/.alias && . ~/.alias || true

if $(command -v gvim > /dev/null)
then
	alias vim='gvim -v'
fi

alias lock='i3lock --color=000000'

#enable "powerline" prompt
powerline_file=/usr/share/powerline/bindings/bash/powerline.sh
if [[ -e $powerline_file ]]
then
	. $powerline_file
fi

# set git to english
#alias git='LANG=en_US git'

if command -v thefuck > /dev/null
then
    eval $(thefuck --alias ups)
fi

bob_bash_completion=$HOME/src/bob/contrib/bash-completion/bob
if [[ -e $bob_bash_completion ]]
then
	# shellcheck source=/dev/null
	source "$bob_bash_completion"
fi

# source: https://github.com/trapd00r/LS_COLORS
# shellcheck source=/dev/null
. "$HOME/.lscolors.sh"
alias ls='ls --color=auto'
alias ll='ls -l'

# fzf bash completion
[ -f /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf
# fzf key bindings
[ -f /usr/share/bash-completion/completions/fzf-key-bindings ] && source /usr/share/bash-completion/completions/fzf-key-bindings
