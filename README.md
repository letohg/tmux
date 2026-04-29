# ~/.config/tmux

## Layout

- `tmux.conf`: full local config entrypoint
- `tmux.server.conf`: minimal entrypoint for servers
- `conf/core.conf`: terminal and core tmux settings
- `conf/keybinds.conf`: custom prefix keybinds
- `conf/navigation.conf`: pane navigation and Vim-aware movement
- `conf/plugins.conf`: TPM plugin list and plugin settings
- `conf/theme.conf`: catppuccin and status bar config

## Install TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Reload

Press `Prefix-R`.

## Install plugins

Press `Prefix-I`.

## Minimal server setup

Use `tmux.server.conf` as the entrypoint when you want the portable setup without plugins and theme:

```bash
tmux -f ~/.config/tmux/tmux.server.conf
```
