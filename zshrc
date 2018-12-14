# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# aliases
if [ -e "$HOME/.functions" ]; then
  source "$HOME/.functions"
fi

# disable local mail check
unset MAILCHECK

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
export SAVEHIST=1000

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
source $HOME/.rvm/scripts/rvm

# Link Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Fix Homebrew path
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

# Local bin path
export PATH=$PATH:~/bin

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Composer path
export PATH=$PATH:~/.composer/vendor/bin

# Editor export
export EDITOR=nano

# Go exports
export GOVERSION="1.2.2"
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION
export GOPATH=$(brew --prefix)/Cellar/go/$GOVERSION/bin
export PATH=$PATH:$GOPATH/bin

# Rails development
export DEVELOPER=josh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Rack development
export RACK_ENV="development"

# Export SSL for DO and Rackspace Vagrant stuff
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Python development
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# syspip(){
#    PIP_REQUIRE_VIRTUALENV="" pip "$@"
# }

# MySQL
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# NVM path
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# PHP CLI path
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /private/tmp/google-cloud-sdk/path.zsh.inc ]; then
  source '/private/tmp/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /private/tmp/google-cloud-sdk/completion.zsh.inc ]; then
  source '/private/tmp/google-cloud-sdk/completion.zsh.inc'
fi

export PATH=~/Library/Python/3.6/bin:$PATH

# Flutter
export PATH=$PATH:$HOME/flutter/bin