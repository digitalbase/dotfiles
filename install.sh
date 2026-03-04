#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_TOOLS_DIR="$HOME/.tmux-tools"

mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config"

ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/.zprofile" "$HOME/.zprofile"
ln -sf "$REPO_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$REPO_DIR/.gitconfig" "$HOME/.gitconfig"

ln -sf "$REPO_DIR/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$REPO_DIR/.config/alacritty/catppuccin-macchiato.toml" "$HOME/.config/alacritty/catppuccin-macchiato.toml"
ln -sf "$REPO_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$TMUX_TOOLS_DIR"
cp -f "$REPO_DIR/.tmux-tools/code-wait" "$TMUX_TOOLS_DIR/code-wait"
cp -f "$REPO_DIR/.tmux-tools/tmux-file-picker" "$TMUX_TOOLS_DIR/tmux-file-picker"
cp -f "$REPO_DIR/.tmux-tools/tmux-session-switcher" "$TMUX_TOOLS_DIR/tmux-session-switcher"
cp -f "$REPO_DIR/.tmux-tools/tmux-zoxide-session" "$TMUX_TOOLS_DIR/tmux-zoxide-session"
cp -f "$REPO_DIR/.tmux-tools/tmux-zoxide-window" "$TMUX_TOOLS_DIR/tmux-zoxide-window"
chmod +x "$TMUX_TOOLS_DIR/code-wait"
chmod +x "$TMUX_TOOLS_DIR/tmux-file-picker"
chmod +x "$TMUX_TOOLS_DIR/tmux-session-switcher"
chmod +x "$TMUX_TOOLS_DIR/tmux-zoxide-session"
chmod +x "$TMUX_TOOLS_DIR/tmux-zoxide-window"

echo "Dotfiles linked."
echo "tmux-tools scripts copied to $TMUX_TOOLS_DIR"
