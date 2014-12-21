ZSH=$HOME/.zsh

ZSH_THEME="steeef"

plugins=o(git)

autoload -U compinit
compinit

source $ZSH/oh-my-zsh.sh

alias ls='ls -G'
alias ll='ls -ltar'

alias sakura='ssh -i /Users/motani/.ssh/id_rsa motani@49.212.54.236 -p 10022'
alias swag='ssh -A -i /Users/motani/.ssh/id_rsa motani@153.121.70.163 -p 10022'
alias ad_pj='ssh -A -i /Users/motani/.ssh/id_rsa motani@157.7.201.137 -p 2222'
