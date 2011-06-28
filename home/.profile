#!/bin/bash
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
  source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
  export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
  _rakecomplete() {
    COMPREPLY=($(compgen -W "`rake -s -T | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
  }
  _capcomplete() {
    COMPREPLY=($(compgen -W "`cap  -T  2>/dev/null| awk '{{ if ( $3 ~ /\#/ ) print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
  }
  complete -o default -o nospace -F _rakecomplete rake
  complete -o default -o nospace -F _capcomplete cap
fi

# Dev env vars
export GILT_DEFAULT_SUBSITE=us
export RAILS_ENV=development
export PLAIN_JAVASCRIPTS=true
export PLAIN_STYLESHEETS=true
export EVENT_NOKQUEUE=1
export PGDATABASE=gilt_us_development

export PATH=/opt/local/bin:$PATH:/opt/local/lib/postgresql90/bin
export PATH=$PATH:/opt/nginx/sbin/
export PATH=$PATH:/Applications/Utilities
export PATH=$PATH:~/bin

# starting stopping services
alias nstop='sudo /opt/nginx/sbin/nginx -c /web/tools/config/nginx/nginx-arbs.conf -s stop'
alias nstart='sudo /opt/nginx/sbin/nginx -c /web/tools/config/nginx/nginx-arbs.conf'
alias is='cd /web/inventory_service && ./bin/dev_inventory.sh file:config/default_config.yaml > /dev/null & tail -f /web/inventory_service/log/*.log'
alias ss='cd /web/service_stack && ./bin/start-dev.sh file:config/dev_config.yml > /dev/null & tail -f /web/service_stack/log/*.log'
alias bb='cd /web/blackbird && ./script/dev.sh > /web/blackbird/log/blackbird.log & tail -f /web/blackbird/log/blackbird.log'
alias swift='cd /web/swift && ./bin/start-dev.sh file:config/dev_config.yml > /web/swift/log/swiftserver.log & tail -f /web/swift/log/swiftserver.log'
alias fbswift='cd /web/facebook_swift && bin/start-dev.sh file:config/dev_config.yml'

#Start and restart postgres
alias pgstart='cd /tmp && sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql90-server/postgresql90-server.wrapper start'
alias pgstop='cd /tmp && sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql90-server/postgresql90-server.wrapper stop'

alias ls='ls -aG'
alias ll='ls -laG'
alias gg='/web/tools/bin/gg'

#git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status -sb'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias logme='git log --author=chicks'
alias pretty='git log --graph --oneline --decorate'

