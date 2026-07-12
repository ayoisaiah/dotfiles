# Neovim Workflow

This repo treats the Neovim config as a small, testable system. Plugin updates should be isolated, reviewed, and easy to roll back.

## Neovim Provider

Headless verification uses the Bob-managed Neovim binary at `~/.local/share/bob/nvim-bin/nvim`. This avoids relying on a PATH `nvim` that may be an AppImage and may fail in headless or FUSE-limited environments.

Chezmoi installs the preferred provider through `run_onchange_after_install-bob-nvim.sh.tmpl` when `bob` is available. Fish also puts `~/.local/share/bob/nvim-bin` early in `PATH`, so shell and Neovim tooling resolve the same editor binary.

## Daily Checks

```sh
just nvim-check
just nvim-health
```

`nvim-check` catches startup errors. `nvim-health` is slower and is useful after changing LSP, formatter, debugger, or Mason tooling.

## Plugin Update Flow

1. Start from a clean branch or create a dedicated plugin-update branch.
2. Check for updates:

   ```sh
   just nvim-plugins-check
   ```

3. Apply updates:

   ```sh
   just nvim-plugins-update
   ```

4. Review `private_dot_config/nvim/lazy-lock.json`.
5. Start Neovim normally and smoke-test your common flows: open a project, edit Lua/Go/JS, format, lint, use Telescope, and use LSP navigation.
6. Commit the lockfile separately from unrelated config edits.

## Rollback

If the update has not been committed:

```sh
just nvim-plugins-revert-lock
just nvim-plugins-restore
```

If the update was committed:

```sh
git revert <plugin-update-commit>
just nvim-plugins-restore
```

The important rule is that plugin version movement lives in `private_dot_config/nvim/lazy-lock.json`. Keeping those commits separate makes rollback predictable.

## Environment Override

The recipes default to `NVIM_APPNAME=nvim` and `NVIM_BIN=~/.local/share/bob/nvim-bin/nvim`. To test another profile or binary:

```sh
NVIM_APPNAME=LazyVim just nvim-check
NVIM_BIN=/path/to/nvim just nvim-check
```
