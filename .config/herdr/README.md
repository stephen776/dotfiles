# Herdr bindings

`config.toml` is linked to `~/.config/herdr/config.toml`.
Install the terminal half with `herdr plugin install lmilojevicc/herdr-splits.nvim`.
Lazy installs the Neovim half from `lua/plugins/herdr-splits.lua` when starting
Neovim inside Herdr. The old tmux navigator spec is retained with `enabled = false`.
After changing Herdr config, run `herdr config check` and `herdr server reload-config`.

| Keys | Action |
| --- | --- |
| Ctrl-a | Prefix |
| Prefix then \| / - | Split side by side / above and below |
| Ctrl-h/j/k/l | Navigate Neovim splits and Herdr panes |
| Prefix then h/j/k/l | Resize Herdr panes |
| Prefix then m | Zoom pane |
| Ctrl-Shift-h/l or prefix then p/n | Previous / next tab |
| Prefix then c / , / x / d | New tab / rename tab / close pane / detach |
| Prefix then f | Workspace picker |
| Prefix then r | Reload config |
| Prefix then Shift-r | Herdr resize mode |
| Prefix then [ | Edit scrollback |
| Ctrl-backslash | Previous Herdr pane |

## Differences from tmux

- Herdr resizes by its native increment, rather than tmux's five cells. Prefix
  resizing affects terminal panes, including when Neovim is running.
- Prefix repeat behavior follows Herdr. Use its resize mode for repeated resizing.
- The workspace picker replaces the tmux-specific sessionizer workflow. The
  Neovim Ctrl-t tmux sessionizer shortcut is disabled inside Herdr.
- Herdr 0.9.0's documented bindings have no last-tab action for Ctrl-a Ctrl-a.
- Edit scrollback replaces entry into tmux copy mode; tmux's v/y selection bindings
  and mouse selection behavior are not portable Herdr key settings.
- Ctrl-backslash switches Herdr panes; the plugin has no smart previous-Neovim-split
  action. Directional navigation wraps at edges, including inside an isolated Neovim.
- Session resurrection/continuum and tmux theme plugins are not migrated.

Plugin documentation: https://github.com/lmilojevicc/herdr-splits.nvim
