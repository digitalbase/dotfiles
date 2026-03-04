#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config"

ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/.zprofile" "$HOME/.zprofile"
ln -sf "$REPO_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$REPO_DIR/.gitconfig" "$HOME/.gitconfig"

ln -sf "$REPO_DIR/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$REPO_DIR/.config/alacritty/catppuccin-macchiato.toml" "$HOME/.config/alacritty/catppuccin-macchiato.toml"
ln -sf "$REPO_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

echo "Dotfiles linked."
echo "If needed, clone ~/.tmux-tools separately on this machine."
