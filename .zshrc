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
	let foo=$?; if [[ $foo != 0 ]]; then if [ $foo == 139 ]; then echo "%BTHE EEPER%b "; else echo "$foo "; fi; fi
}

# OH-MY-ZSH OPTIONS
export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
plugins=(
	sudo
	z
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

source ~/.config/aliasrc ~/.config/pfetchrc
alias sudo="doas"
alias vzrc="v ~/.zshrc"
alias rzrc="source ~/.zshrc"
PRF=""
PS1='%F{magenta}$(if [[ "$PRF" != "" ]]; then echo "[$PRF] "; fi)%f%F{blue}%B%n%b%f%F{cyan}@%m%f %F{yellow}%~%f
%F{red}$(let foo=$?; if [[ $foo != 0 ]]; then if [ $foo == 139 ]; then echo "%BTHE EEPER%b "; else echo "$foo "; fi; fi)%f%(!.#.%%) '

[ -d "/home/bit/.path" ] && export PATH="/home/bit/.local/bin:/home/bit/Apps:/home/bit/.path:$PATH"
