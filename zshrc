export PROMPT='%~$(current_git_branch)%(!.!.:) '
export RPROMPT=''

export EDITOR="emacs"

alias la="ls -A"
alias ll="ls -l"

alias c="clear"
alias e="emacs -nw"
alias r!="source ~/.zshrc"

# For Rake to work with zsh:
alias rake="noglob rake"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt inc_append_history

# Coloured output for BSD ls:
export CLICOLOR=1

# Colours in zsh:
autoload -U colors && colors

# Substitute variables in prompt:
setopt prompt_subst

function current_git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "[${ref#refs/heads/}$(current_directory_dirty)]"
}

function current_directory_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "%{$fg[red]%}+%{$reset_color%}"
  fi
}

# Write STDERR in red:
exec 2>>(while read line; do
  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)