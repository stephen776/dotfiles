# Dotfiles

GNU Stow packages, checked out at `~/dotfiles`. Run commands from this directory.
Install Stow with `omarchy pkg add stow` on Omarchy or `brew install stow` on macOS.

## Linux (Omarchy)

Preview links, then apply them:

```sh
stow --simulate --verbose herdr nvim-linux ghostty-linux kitty-linux git-linux tmux-linux tmux-sessionizer tmux-sessionizer-linux ideavim kanata-linux agents
stow herdr nvim-linux ghostty-linux kitty-linux git-linux tmux-linux tmux-sessionizer tmux-sessionizer-linux ideavim kanata-linux agents
```

The Linux packages preserve the installed Omarchy settings. Herdr uses Ctrl+A
as its prefix, followed by `|` for a side-by-side split or `-` for above/below.
See [Herdr bindings](herdr/README.md).

Git reads machine-specific credential helpers from `~/.config/git/config.local`.
That file stays outside this repository. On a new machine, configure credentials
locally after linking the package.

`kanata-linux` links the Kanata config and its systemd user unit. After linking it,
run `systemctl --user daemon-reload && systemctl --user enable --now kanata`. Caps
Lock is Escape on tap and Control on hold. Update `linux-dev-names-include` to match
names in `/proc/bus/input/devices` for other keyboards.

`agents` links one shared instruction file to `~/.codex/AGENTS.md` and, through a
relative symlink in the package, to `~/.claude/CLAUDE.md`.

Neovim's `lua/plugins/theme.lua` symlink remains managed by Omarchy. Runtime state,
Herdr logs, sockets, and plugin installations are not Stow-managed.

## macOS

The original configurations are preserved in the `*-macos` packages. Select the
apps you use; for example:

```sh
stow --simulate --verbose herdr nvim-macos ghostty-macos git-macos tmux-macos tmux-sessionizer tmux-sessionizer-macos zsh-macos ideavim agents
```

Remove `--simulate --verbose` to apply. Optional packages include `aerospace-macos`,
`kanata-macos`, `kitty-macos`, and `wezterm`. Select only one platform variant per
app, including Git and tmux even though their variants use different target paths.

## Managing links

`.stowrc` targets the parent directory and uses `--no-folding` to link individual
files, keeping application state and Omarchy-managed files out of the repository.
Use named packages, not `stow .` or `stow *`.

Existing regular files cause conflicts. Compare and back them up before removing
them from the target path, then rerun the preview. Avoid `--adopt` unless you
intend to replace repository files with the installed versions.

```sh
stow --restow herdr  # Refresh links after adding or moving files
stow --delete herdr  # Remove links, retaining repository files
```

After Herdr changes, run `herdr config check` and `herdr server reload-config`.
Restart Neovim to load its updated plugin configuration.

The initial Linux migration backup is under
`~/.local/state/dotfiles-backups/20261002-193946/`: `repository/` contains the
previous repo layout, and `installed/` contains the files replaced by symlinks.
To restore installed files, first unstow the packages listed in `packages.json`,
then copy `installed/` back into your home directory.
