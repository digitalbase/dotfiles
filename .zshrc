# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"


export EDITOR="/opt/homebrew/bin/code"
export VISUAL="$HOME/.tmux-tools/code-wait"
export GIT_EDITOR="$HOME/.tmux-tools/code-wait"

export PATH="$PATH:$HOME/.tmux-tools"

alias wm='workmux'
#eval "$(workmux completions zsh)"

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"

export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
