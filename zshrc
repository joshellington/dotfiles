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

# functions
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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Link Yarn
# export PATH="$PATH:$HOME/.yarn/bin"

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
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Rails development
export DEVELOPER=josh

# Rack development
export RACK_ENV="development"

# Export SSL for DO and Rackspace Vagrant stuff
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Python development
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
# export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# syspip(){
#    PIP_REQUIRE_VIRTUALENV="" pip "$@"
# }
#export PYTHONPATH="/usr/local/Cellar/python/3.7.3/bin/python3:$PYTHONPATH"

# PYENV, python
# export PATH="/Users/joshellington/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# MySQL
# MYSQL=/usr/local/mysql/bin
# export PATH=$PATH:$MYSQL
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PHP CLI path
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# Flutter
# export PATH=$PATH:$HOME/flutter/bin

# RUBY rbenv
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/josh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/josh/google-cloud-sdk/completion.zsh.inc'; fi
