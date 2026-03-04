# tmux-tools

Small tmux utilities for session management.

Requires **tmux 3.2+** (for `display-popup`).

## Install

```bash
git clone https://github.com/raine/tmux-tools.git ~/.tmux-tools
export PATH="$PATH:$HOME/.tmux-tools"  # add to .bashrc/.zshrc
```

If tmux is already running, update its PATH:

```bash
tmux set-environment -g PATH "$PATH"
```

## tmux-session-switcher

Fast session switcher in a floating popup. Shows sessions sorted by most
recently used.

Add to `~/.tmux.conf`:

```bash
bind C-j display-popup -E "tmux-session-switcher"
```

Requires [fzf](https://github.com/junegunn/fzf).

## tmux-zoxide-window

Pick from zoxide's frecent directories and open in a new tmux window.

Add to `~/.tmux.conf`:

```bash
bind C-o display-popup -E "tmux-zoxide-window"
```

Requires [fzf](https://github.com/junegunn/fzf) and [zoxide](https://github.com/ajeetdsouza/zoxide).

## tmux-file-picker

Fuzzy-find files and open them in a new tmux window.

↳ https://github.com/raine/tmux-file-picker

## tmux-bro

Create or switch to a tmux session for a project directory.

↳ https://github.com/raine/tmux-bro

## License

MIT
