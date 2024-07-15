eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [[ "$(uname)" == "Darwin" ]]; then
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/Users/stephen/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "/Users/stephen/miniforge3/etc/profile.d/conda.sh" ]; then
		. "/Users/stephen/miniforge3/etc/profile.d/conda.sh"
	    else
		export PATH="/Users/stephen/miniforge3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<

	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ $(grep -i Microsoft /proc/version) ]]; then
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/highlighters
	source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh	
fi

# Print Opening message
source ~/open_message.sh
echo "\033[1;32m$message\033[0m"

# ---- Starship Prompt ----
eval "$(starship init zsh)"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# ---- Fuzzy Finder ----
source <(fzf --zsh)

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

alias ls="eza --icons=always --color=always --long --no-filesize --no-time --no-user"
alias cd="z"
c() {
  z "$1" && eza -la --icons=always --color=always --long --no-filesize --no-time --no-user --group-directories-first --no-permissions
}
