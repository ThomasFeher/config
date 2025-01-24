#allow users to specify their own ~/.profile
if [ -f ~/.profile.local ]; then
	source ~/.profile.local
fi

#ensure our ssh-agent is running and that our keys are added
eval $(ssh-agent) > /dev/null
keys=$(ssh-add -l > /dev/null ; echo $?)
if [[ $keys != "0" ]]; then
	ssh-add
fi

# avoid duplicates in bash history
export HISTCONTROL=ignoredups:erasedups
# do not limit the size of the bash history
export HISTSIZE=-1

# used by tools installed via pip and probably others
export PATH="$PATH:$HOME/.local/bin"

# used by tools installed via yarn
export PATH="$PATH:$HOME/.yarn/bin"

# use custom built neovim
export PATH="$HOME/bin/neovim/bin:$PATH"

# use custom build executables
export PATH="$HOME/bin:$PATH"

# use neovim for all kinds of text editing
export EDITOR=nvim
export GIT_EDITOR=nvim
export VISUAL=nvim
export DIFFPROG="nvim -d"
# Use neovim as manpager `:h Man`
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
	export QT_QPA_PLATFORMTHEME="qt5ct"
	export XDG_MENU_PREFIX=plasma-
fi

# if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_TTY" ]; then
# 	neo_dir=$HOME/neo/
# 	if [[ -e $neo_dir ]]
# 	then
# 		export PATH=$PATH:$neo_dir
# 		boneg # for normal german keyboards
# 		# bone # for truely ergonomic and ergodox
# 	fi
# fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
