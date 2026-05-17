# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"


#export EDITOR="/opt/homebrew/bin/code"
export EDITOR="/usr/bin/nano"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"

export PATH="$PATH:$HOME/.tmux-tools"
export PATH="$HOME/scripts:$PATH"

alias wm='workmux'
alias wml='workmux-linear'
#eval "$(workmux completions zsh)"

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

export PATH="/opt/homebrew/opt/php@8.4/bin:$PATH"

export PATH="/opt/homebrew/opt/php@8.4/sbin:$PATH"

export PATH="$HOME/scripts:$PATH"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# OpenFang
export PATH=/Users/gijs/.openfang/bin:$PATH

# pnpm
export PNPM_HOME="/Users/gijs/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# sonar
export PATH="/Users/gijs/.local/bin:$PATH"

# Go binaries installed with `go install`
export GOPATH="${GOPATH:-$HOME/go}"
case ":$PATH:" in
  *":$GOPATH/bin:"*) ;;
  *) export PATH="$GOPATH/bin:$PATH" ;;
esac

# Kubernetes production app shell. Defaults to the worker-mem-intensive pod.
# Usage: k8ss [pod-name]
k8ss() {
  local pod="$1"
  local container="worker-mem-intensive"
  local workdir="/source"

  if [ -z "$pod" ]; then
    pod="$(kubectl -n production get pod -l job_queue=mem_intensive -o jsonpath='{.items[0].metadata.name}')"
  fi

  if [ -z "$pod" ]; then
    echo "Could not find a worker-mem-intensive pod" >&2
    return 1
  fi

  kubectl -n production exec -it "$pod" -c "$container" -- /usr/bin/bash -lc "cd '$workdir' && exec /usr/bin/bash"
}
eval "$(direnv hook zsh)"
eval "$(direnv hook zsh)"
