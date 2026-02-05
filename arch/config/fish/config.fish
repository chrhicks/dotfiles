set -gx DOTS $HOME/.dotfiles
set -gx DOTS_ARCH $DOTS/arch

test -e ~/.profile.fish && source ~/.profile.fish
