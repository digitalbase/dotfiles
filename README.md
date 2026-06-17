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

## Deployment workflow

This repo is the source of truth for shared terminal and agent configuration. Do not manually copy tracked config files to remote hosts with `scp`, heredocs, clipboard, or direct file writes. Make changes here, commit them, push to `origin/master`, then pull and install on each host.

Hosts to update after dotfiles changes:

- `mini`: `/Users/gijs/Projects/dotfiles`
- `homer`: `/home/gijs/Projects/dotfiles`
- `dokploy`: `/root/Projects/dotfiles`

Typical update flow:

```bash
git add <intended files>
git commit -m "..."
git push origin master
ssh mini 'git -C /Users/gijs/Projects/dotfiles pull --ff-only && /Users/gijs/Projects/dotfiles/install.sh'
ssh homer 'git -C /home/gijs/Projects/dotfiles pull --ff-only && /home/gijs/Projects/dotfiles/install.sh'
ssh dokploy 'git -C /root/Projects/dotfiles pull --ff-only && /root/Projects/dotfiles/install.sh'
```

If a host has local changes and pull refuses, inspect with `git -C <repo> status --short` and `git -C <repo> diff`. Preserve host-local edits; stash only the needed files, pull, reapply, resolve conflicts by preserving host-local intent, then run `install.sh`.

Reload notes:

- Starship reloads when a new shell starts; run `exec zsh` or open a new SSH/tmux pane.
- OpenCode config and instructions are loaded at startup; quit and restart OpenCode after instruction/config changes.

## Notes

- This repo tracks terminal and shell configs only.
- `install.sh` copies bundled `.tmux-tools` scripts to `~/.tmux-tools`.
- Agent shortcuts share one registry in `.tmux-tools/agent-common`; use `ahelp`, `agent list`, `aedit <agent> [file]`, `aput <agent|all> <local> [remote]`, `aget <agent> <remote> [local]`, `acp <source-agent> <source-path> <target-agent|all> [target-path]`, `ashell <agent>`, `achat <agent>`, `ahermes <agent> [args...]`, and `hermes [agent] [args...]`. The `hermes` command always runs in the Marie pod; without an agent name it uses Marie's default profile. Preset Kubernetes agents run through the Marie Hermes pod on context `orion`; their files live under `/opt/data/profiles/<profile>`, and profiled Hermes commands are run as `hermes -p <profile> --tui ...`. The `personal` agent uses `ssh homer` plus `docker exec hermes`. Add new agents by appending one row to `AGENT_TARGETS`.
- On apt-based Linux hosts, `bootstrap-host.sh` installs the required terminal tools: `git`, `ssh`, `zsh`, `curl`, `tmux`, `mosh`, `fzf`, `zoxide`, `direnv`, `ripgrep`, `tree`, `fd`, `bat`, `gh`, and `starship`.
- `bootstrap-host.sh` backs up conflicting files under `~/.dotfiles-backup/`, runs `install.sh`, installs the tmux plugin manager if missing, and installs configured tmux plugins.
- Put host-specific aliases and shortcuts in `~/.zshrc.local`; the shared `.zshrc` sources it when present.
