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

	source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ $(grep -i Microsoft /proc/version) ]]; then
	export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
	export ZSH="$HOME/.oh-my-zsh"
	ZSH_THEME="powerlevel10k/powerlevel10k"
	source $ZSH/oh-my-zsh.sh
	if [[ ! $(grep "\[shell\]" ~/.config/alacritty/alacritty.toml) ]]; then	
		echo "
[shell]
    program = \"wsl\"" >> .config/alacritty/alacritty.toml
	fi
	cp -r ~/.config/alacritty /mnt/c/users/stevo/AppData
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source ~/open_message.sh
echo "\033[1;32m$message\033[0m"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

