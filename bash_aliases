# Unix
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'
alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"

# git
alias g="git"
alias gci="git pull --rebase && rake && git push"
alias gco="git checkout"
alias gpl="git pull origin"
alias gps="git push origin"
alias gac="git add . -A; git commit"
alias gs="git status"
alias assume="git update-index --assume-unchanged"
alias unassume="git update-index --no-assume-unchanged"
alias assumed="!git ls-files -v | grep ^h | cut -c 3-"

# Bundler
alias b="bundle"

# Tests and Specs
alias t="ruby -I test"
alias s="bundle exec rspec"
alias cuc="bundle exec cucumber"

# Rubygems
alias gi="gem install"
alias giv="gem install -v"

# Rails
alias migrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"

# Heroku staging
alias staging-console='heroku run console --remote staging'
alias staging-process='watch heroku ps --remote staging'
alias staging-releases='heroku releases --remote staging'
alias staging-tail='heroku logs --tail --remote staging'

# Heroku production
alias production-console='heroku run console --remote production'
alias production-process='watch heroku ps --remote production'
alias production-releases='heroku releases --remote production'
alias production-tail='heroku logs --tail --remote production'

# Heroku databases
alias db-backup-production='heroku pgbackups:capture --remote production'
alias db-copy-production-to-staging='heroku pgbackups:restore DATABASE `heroku pgbackups:url --remote production` --remote staging  --confirm `basename $PWD`-staging'

# Sublime Text
alias slt='open -a "/Applications/Sublime Text 2.app"'

# Projects
alias p='cd ~/Projects/'

# Randoms
alias e='exit'
alias flush='dscacheutil -flushcache'
alias serv='python -m SimpleHTTPServer'
alias html5='wget https://github.com/joshellington/html-boilerplate/archive/master.zip; unzip master.zip -d ./; mv html-boilerplate-master/* ./; rm master.zip; rm -r html-boilerplate-master;'
alias curl='noglob curl'