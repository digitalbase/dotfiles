#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${DOTFILES_REPO_URL:-git@github.com:digitalbase/dotfiles.git}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/Projects/dotfiles}"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d%H%M%S)"

install_linux_tools() {
  if [ "$(uname -s)" != "Linux" ]; then
    return 0
  fi

  if ! command -v apt-get >/dev/null 2>&1; then
    echo "Linux host detected, but only apt-based installs are automated." >&2
    return 0
  fi

  local missing_packages=()

  command -v zsh >/dev/null 2>&1 || missing_packages+=(zsh)
  command -v curl >/dev/null 2>&1 || missing_packages+=(curl)
  command -v zoxide >/dev/null 2>&1 || missing_packages+=(zoxide)
  command -v direnv >/dev/null 2>&1 || missing_packages+=(direnv)

  if [ "${#missing_packages[@]}" -gt 0 ]; then
    sudo apt-get update
    sudo apt-get install -y "${missing_packages[@]}"
  fi

  if ! command -v starship >/dev/null 2>&1; then
    curl -fsSL https://starship.rs/install.sh | sudo sh -s -- -y
  fi

  if command -v zsh >/dev/null 2>&1 && command -v chsh >/dev/null 2>&1; then
    local zsh_path current_shell
    zsh_path="$(command -v zsh)"
    current_shell="$(getent passwd "$(id -un)" | cut -d: -f7)"

    if [ "$current_shell" != "$zsh_path" ]; then
      sudo chsh -s "$zsh_path" "$(id -un)"
    fi
  fi
}

if ! command -v git >/dev/null 2>&1; then
  echo "git is required before bootstrapping dotfiles." >&2
  exit 1
fi

install_linux_tools

if [ ! -d "$DOTFILES_DIR/.git" ]; then
  mkdir -p "$(dirname "$DOTFILES_DIR")"
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

if [ -n "$(git status --short)" ]; then
  echo "Dotfiles repo has local changes; refusing to overwrite anything." >&2
  git status --short >&2
  exit 1
fi

git pull --ff-only

backup_path() {
  local path="$1"
  local target="$2"

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$path" ]; then
      return 0
    fi

    mkdir -p "$BACKUP_DIR/$(dirname "${target#$HOME/}")"
    mv "$target" "$BACKUP_DIR/${target#$HOME/}"
    echo "Backed up $target to $BACKUP_DIR/${target#$HOME/}"
  fi
}

backup_path "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
backup_path "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
backup_path "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
backup_path "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
backup_path "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
backup_path "$DOTFILES_DIR/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
backup_path "$DOTFILES_DIR/.config/alacritty/catppuccin-macchiato.toml" "$HOME/.config/alacritty/catppuccin-macchiato.toml"

"$DOTFILES_DIR/install.sh"

if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
  mkdir -p "$HOME/.tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Host initialised. Restart your shell or run: exec zsh"
echo "In tmux, press prefix + I to install tmux plugins."
