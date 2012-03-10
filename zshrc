#!/usr/bin/env zsh

export PROMPT='%{$fg[cyan]%}%~%{$reset_color%}$(git_branch)%(!.!.) '
export RPROMPT=''

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
export CLICOLOR=1

if [[ -x `which emacs` ]] then EDITOR="emacs"; fi

alias emacs="emacs -nw"
alias la="ls -a"
alias ll="ls -l"
alias c="clear"
alias r="source ~/.zshrc"

setopt prompt_subst
setopt inc_append_history
setopt no_beep
setopt hist_ignore_dups
setopt menucomplete

unsetopt auto_list

autoload -U colors && colors
autoload compinit  && compinit

git_branch() {
    git_status() {
        if [[ -n $(git status -s 2> /dev/null) ]];
        then echo "%{$fg[red]%}";
        else echo "%{$fg[green]%}"; fi
    }
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " git $(git_status)${ref#refs/heads/}%{$reset_color%}"
}

exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)
