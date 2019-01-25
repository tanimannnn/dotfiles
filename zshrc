ZSH=$HOME/.zsh

ZSH_THEME="steeef"

plugins=o(git)

autoload -U compinit
compinit

source $ZSH/oh-my-zsh.sh

alias ls='ls -G'
alias ll='ls -ltar'
alias -g P='| peco'
alias history=history
alias reload='exec /bin/zsh -l'

alias sakura='ssh -i /Users/motani/.ssh/id_rsa motani@49.212.54.236 -p 10022'
alias swag='ssh -A -i /Users/motani/.ssh/id_rsa motani@153.121.70.163 -p 10022'
alias ad_pj='ssh -A -i /Users/motani/.ssh/id_rsa motani@157.7.201.137 -p 2222'

export GOPATH=$HOME/Develop/go
export PATH=$PATH:$HOME/.bin

# peco functions
function peco-cmdsearch() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \ eval $tac | \ peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-cmdsearch
bindkey '^r' peco-cmdsearch
function peco-sshsearch() {
    ssh_server=$((cat ~/.ssh/known_hosts | sed -e 's/[, ].*$//' | sort -u) | peco --query "$LBUFFER")
    if [ -n "$ssh_server" ]; then
        BUFFER="ssh $ssh_server"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-sshsearch
bindkey '^s' peco-sshsearch
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey "^[g" peco-src
