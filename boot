#!/bin/bash

DOT_TARGET=$HOME;
CONFIG=$HOME/.config
DOTS=$HOME/.dotfiles

source "$DOTS/fish/util/colors.sh";


# install Homebrew if missing
command -v brew > /dev/null || {
  echo -e "Homebrew is missing. ${bold:?}Installing homebrew.${stop:?}";
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)" # add `brew` to the PATH
}

# install fish
command -v fish &> /dev/null || {
  echo -e "Missing fish shell. ${bold:?}Installing fish shell.{$stop:?}";
  command -v brew &> /dev/null || {
    echo "${bold:?}Still missing homebrew.${stop:?}";
  }
  command -v brew &> /dev/null && {
    brew install fish;
  }
}

command -v fish &>/dev/null || {
  echo -e ${red:?}Fish not found${stop:?};
  exit 1;
}

# Run the rest of the install scripts in fish
command -v fish &> /dev/null && {
  fish $DOTS/setup;
}

command -v fish &> /dev/null && {
  fish $DOTS/app_install;
}

command -v fish &> /dev/null && {
  fish $DOTS/shell_setup;
}
