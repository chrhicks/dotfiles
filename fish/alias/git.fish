alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status -sb'
alias gd="git diff"
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias logme='git log --author=chrhicks'
alias pretty='git log --graph --oneline --decorate'

# Prune Branches
# alias gitgc='git checkout main && git fetch -p && for branch in `git branch -vv | grep '"'"': gone]'"'"' | awk '"'"'{print $1}'"'"'`; do git branch -D $branch; done'

# eval "$(hub alias -s)"
