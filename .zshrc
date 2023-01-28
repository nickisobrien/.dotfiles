# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="awesomepanda"

plugins=(
  autojump
  brew
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/sublime_text"

export SSH=$HOME/.ssh/
export PATH="/usr/local/opt/openssl/bin:$PATH"
export VISUAL=vim

alias v="nvim"

#color schemes in tmux
alias tmux="TERM=screen-256color-bce tmux"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Cfg Aliases
alias npmrc="nvim ~/.npmrc"
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias ohmyzshp="nvim ~/.oh-my-zsh/oh-my-zsh-private.sh"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshcfg="nvim ~/.zshrc"

# tmux aliases
alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
alias tcfg="nvim ~/.tmux.conf"

# git aliases
alias g='git'
alias gs='git status'

alias ga='git add'
alias gaa='git add --all'

alias gc='git commit'
alias gcm='git commit --message'
alias gca='git commit --add'
alias gcam='git commit --add --message'
alias gce='git commit --amend'  # Edit commit message. 'gce' = 'git commit edit'

alias gb='git branch'
alias gba='git branch --all'

alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'

alias gmt='git mergetool'

alias gch='git checkout'
alias gchm='git checkout master'
alias gchb='git checkout -b'

alias gl='git log --decorate'
alias glo='git log --decorate --graph --oneline'
alias gloa='git log --decorate --graph --oneline --all'
alias glao='gloa'
alias gls='git log --decorate --graph --stat'
alias gla='git log --decorate --graph --all'
alias gld='git log --decorate --graph --patch'  # Show diff. 'gld' = 'git log diff'
alias glda='git log --decorate --graph --patch --all'
alias glad='glda'

alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'

alias gri='git rebase --interactive'
alias grc='git rebase --continue'
