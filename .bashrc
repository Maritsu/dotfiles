# .bashrc

# Vim edit mode
set -o vi
EDITOR="nvim"
VISUAL="nvim"

# Set tab width to 4
tabs 4

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source extra configs
[ -f "/home/bit/.config/aliasrc" ] && source "/home/bit/.config/aliasrc"
[ -f "/home/bit/.config/pfetchrc" ] && source "/home/bit/.config/pfetchrc"

# Add local PATH
[ -d "/home/bit/.path" ] && export PATH="/home/bit/.local/bin:/home/bit/Apps:/home/bit/.path:$PATH"

# Custom prompt
oldPS1='[\u@\h \W]\$ '
# export PS1='\[\e[0;90m\][\[\e[0;1;94m\]\u\[\e[0;95m\]@\[\e[0;95m\]\h\[\e[0m\] \[\e[0;1;93m\]\W\[\e[0;90m\]]\[\e[0m\]$\[\e[0m\] \[\e[0m\]'
export PS1='\e[1;34m\u\e[m\e[36m@\h\e[m \e[33m\w\e[m\n$(foo=$?; if [[ $foo != 0 ]]; then echo -e "\e[0;31m$foo\e[m "; fi)\$ '
# ( $(if [[ $UID = 0 ]]; then printf "\e[31m#\e[m"; else printf "$" ))

# LS colors
# export LS_COLORS='di=01;32:ln=01;94:or=00;31:ex=00;34:bd=00;33:cd=00;33:*.gz=00;35:*.zip=00;35:*.7z=00;35:*.AppImage:00;34:*.pdf=00;91:*.cpp=00;36:*.c=00;36:*.h=00;36:*.hpp=00;36:*.py=00;36:*.sh=00;34:*.o=00;37:*.so=00;37'

# Detach processes ran with &
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'disown -a -h'
