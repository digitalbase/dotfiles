
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
[ -r ~/.orbstack/shell/init.zsh ] && source ~/.orbstack/shell/init.zsh
