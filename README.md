# dotfiles

## Included configs

- `.zshrc`
- `.zprofile`
- `.tmux.conf`
- `.gitconfig`
- `.config/alacritty/alacritty.toml`
- `.config/alacritty/catppuccin-macchiato.toml`
- `.config/starship.toml`
- `AGENTS.md`, linked for Codex and OpenCode
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
- On apt-based Linux hosts, `bootstrap-host.sh` installs the required terminal tools: `git`, `ssh`, `zsh`, `curl`, `tmux`, `mosh`, `fzf`, `zoxide`, `direnv`, `ripgrep`, `tree`, `fd`, `bat`, `gh`, and `starship`.
- `bootstrap-host.sh` backs up conflicting files under `~/.dotfiles-backup/`, runs `install.sh`, installs the tmux plugin manager if missing, and installs configured tmux plugins.
- Put host-specific aliases and shortcuts in `~/.zshrc.local`; the shared `.zshrc` sources it when present.
