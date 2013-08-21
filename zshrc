# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^B" backward-word
bindkey "^F" forward-word

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# enable history saving on shell exit
HISTFILE=$HOME/.zhistory

# keep TONS of history
export HISTSIZE=4096

# save history between sessions
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# save timestamp and runtime information
setopt EXTENDED_HISTORY

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
# setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# No beep
setopt no_beep

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# Leave rake alone
alias rake='noglob rake'

# Tab completion
setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# NPM path
export PATH="/usr/local/share/npm/bin:${PATH}"

# Link RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Fix Homebrew path
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

# Local bin path
export PATH=$PATH:~/bin

# Editor export
export EDITOR='subl -w'

# Go exports
export GOVERSION="1.1.2"
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION
export GOPATH=$(brew --prefix)/Cellar/go/$GOVERSION/bin
export PATH=$PATH:$GOPATH/bin