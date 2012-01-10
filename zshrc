#!/usr/bin/env zsh

export PROMPT='%{$fg[cyan]%}%~%{$reset_color%}$(git_branch)%(!.!.) '
export RPROMPT='$(dir_status)'

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
export CLICOLOR=1

if [[ -x `which emacs` ]] then EDITOR="emacs"; fi

alias la="ls -lA"
alias ll="ls -l"
alias c="clear"
alias e="emacs -nw"
alias r="source ~/.zshrc"
alias -g l="| less"

setopt prompt_subst
setopt inc_append_history
setopt no_beep
setopt hist_ignore_dups
setopt menucomplete

unsetopt auto_list

autoload -U colors && colors
autoload compinit  && compinit

function git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " git $(git_status)${ref#refs/heads/}%{$reset_color%}"
}

function git_status() {
    if [[ -n $(git status -s 2> /dev/null) ]];
    then echo "%{$fg[red]%}";
    else echo "%{$fg[green]%}"; fi
}

function dir_status() {
    function p() { if [[ -n $(ls | egrep "$1") ]]; then
        echo -n "%{$fg[$2]%} $3%{$reset_color%}"; fi }
    
    p '\.rb' 'red' 'ruby'
    p '\.lisp' 'blue' '(λ)'
    p '\.hs|\.lhs' 'cyan' '\='
    p '[Cc]onfigure|', '', 'configure'
    p '[Mm]akefile|', '', 'make'
}

exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)
