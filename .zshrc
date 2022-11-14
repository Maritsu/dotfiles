zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]} r:|[._-]=* r:|=*' '' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/bit/.zshrc'

autoload -Uz compinit
compinit

autoload -U zmv
HISTFILE=~/.zsh_hist
HISTSIZE=1024
SAVEHIST=2048
setopt share_history hist_ignore_all_dups autocd chase_links
unsetopt beep nomatch
bindkey -v

function checkexit() {
	local LEC=$?
	if [[ $LEC -ne 0 ]]; then
		local ECP=""
		ECP+="%{$fg[red]%}$LEC%{$reset_color%}"
		echo $ECP
	fi
}

# OH-MY-ZSH OPTIONS
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source ~/.config/aliasrc ~/.config/pfetchrc
alias vzrc="v ~/.zshrc"
alias rzrc="source ~/.zshrc"
PS1="%F{blue}%B%n%b%f%F{cyan}@%m%f %F{yellow}%~%f
$(checkexit)%(!.#.%%) "
RPROMPT="$(checkexit)"
