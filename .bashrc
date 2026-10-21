#
# ~/.bashrc
#
#test -f ~/.cache/wal/colors-kitty.conf && kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

stty -ixon

export WIFI_STATE=true

export PATH=$PATH:/home/fish/.spicetify:$HOME/.local/bin:$HOME/Applications/zen/:$HOME/Applications/wireshark/run/
eval "$(starship init bash)"

. "$HOME/.local/bin/env"
