#!/bin/bash
if [ -f ~/.chicksrc ]; then
        . ~/.chicksrc
fi

export PATH=$PATH:/Applications/Utilities
export PATH=$PATH:~/bin

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

cloneit () {
  git clone --recursive ssh://gerrit.gilt.com:29418/$1.git
}

drill () {
  STAGE_HOST='qa.ec2.gilt.com'
  if [ $1 -ge "50" ]
    then
      STAGE_HOST='giltqa.com'
  fi

  /web/tools/bin/tunnel.rb -v --config=losa --host=stage$1.$STAGE_HOST --include=svc-inventory --include=rabbitmq
}

