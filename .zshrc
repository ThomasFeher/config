# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# time warrior aliases
alias tws='timew summary :ids :annotations'
alias twlog='timew tasklog :day'

# allow <Esc #> to store the commented line in the history for later use
setopt interactivecomments

# see escape sequences for <key> by using Ctrl-V<key> on the command line
# vi mode
bindkey -v
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
# page up and down for searching command history
bindkey "\e[5~" history-beginning-search-backward
bindkey "\e[6~" history-beginning-search-forward
# delete
bindkey "^[[3~" delete-char                                     # Delete key

# fzf key bindings
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# fzf bash completion
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
	# note: alias seems to not work with dmenu
	alias dolphin="XDG_CURRENT_DESKTOP=kde /usr/bin/dolphin"
fi

# include local bash completions
autoload bashcompinit
bashcompinit
for file in ~/.local/share/bash-completion/completions/*
do
	source "$file"
done
