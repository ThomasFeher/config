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

# fzf bash completion
[ -f /usr/share/fzf/completions.zsh ] && source /usr/share/fzf/completions.zsh
# fzf key bindings
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

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
