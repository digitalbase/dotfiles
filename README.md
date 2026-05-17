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
git clone git@github.com:digitalbase/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/bootstrap-host.sh
```

If the repo is already present, rerun `~/Projects/dotfiles/bootstrap-host.sh` to fast-forward it and relink configs.

## Notes

- This repo tracks terminal and shell configs only.
- `install.sh` copies bundled `.tmux-tools` scripts to `~/.tmux-tools`.
- `bootstrap-host.sh` backs up conflicting files under `~/.dotfiles-backup/`, runs `install.sh`, and installs the tmux plugin manager if missing.
