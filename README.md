# dotfiles

## Included configs

- `.zshrc`
- `.zprofile`
- `.tmux.conf`
- `.gitconfig`
- `.config/alacritty/alacritty.toml`
- `.config/alacritty/catppuccin-macchiato.toml`
- `.config/starship.toml`
- `.tmux-tools/*` helper scripts

## Install on a new machine

```bash
git clone https://github.com/digitalbase/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

## Notes

- This repo tracks terminal and shell configs only.
- `install.sh` copies bundled `.tmux-tools` scripts to `~/.tmux-tools`.
