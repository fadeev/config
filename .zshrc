# Bash prompt:
export PS1="\w: "

# Zsh prompt (the nice one):
export PROMPT='%~$(current_git_branch)%(!.!.:) '
export RPROMPT=''

export PATH="$HOME/bin:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/bin"
export PATH="$PATH:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:/usr/X11/bin:/opt/local/bin"

export EDITOR="vim"

alias la="ls -A"
alias lf="ls -F"
alias ll="ls -l"

alias gc="git commit"
alias gca="git commit -a"
alias gs="git status"
alias gp="git push"
alias gl="git pull"
alias gb="git branch"
alias gco="git checkout"

alias r!=". ~/.zshrc"
alias c="clear"

# For Rake to work with zsh:
alias rake="noglob rake"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt inc_append_history

autoload -U colors && colors

# Substitute variables in prompt:
setopt prompt_subst

export SCALA_HOME="/usr/local/Cellar/scala/2.9.0.1"

function current_git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "[${ref#refs/heads/}$(current_directory_dirty)]"
}

function current_directory_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "%{$fg[red]%}+%{$reset_color%}"
  fi
}
