#!/bin/bash
if [ -f ~/.chicksrc ]; then
        . ~/.chicksrc
fi

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

