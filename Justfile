set dotenv-load := false

NVIM_APPNAME := env_var_or_default("NVIM_APPNAME", "nvim")
NVIM_CONFIG := "private_dot_config/nvim"
NVIM_LOCK := NVIM_CONFIG + "/lazy-lock.json"
NVIM_BIN := env_var_or_default("NVIM_BIN", env_var("HOME") + "/.local/share/bob/nvim-bin/nvim")

default:
    @just --list

# Start Neovim headless to catch config load errors.
nvim-check:
    NVIM_APPNAME={{NVIM_APPNAME}} {{NVIM_BIN}} --headless "+qa"

# Run Neovim health checks. Use this after plugin or tooling changes.
nvim-health:
    NVIM_APPNAME={{NVIM_APPNAME}} {{NVIM_BIN}} --headless "+checkhealth" "+qa"

# Ask lazy.nvim to report plugin updates without changing the lockfile.
nvim-plugins-check:
    NVIM_APPNAME={{NVIM_APPNAME}} {{NVIM_BIN}} --headless "+Lazy! check" "+qa"

# Restore plugins to the versions pinned in lazy-lock.json.
nvim-plugins-restore:
    NVIM_APPNAME={{NVIM_APPNAME}} {{NVIM_BIN}} --headless "+Lazy! restore" "+qa"

# Update plugins and leave the lazy-lock.json diff for review.
nvim-plugins-update:
    NVIM_APPNAME={{NVIM_APPNAME}} {{NVIM_BIN}} --headless "+Lazy! sync" "+qa"
    git diff -- {{NVIM_LOCK}}

# Show the exact lockfile diff from a plugin update.
nvim-plugins-diff:
    git diff -- {{NVIM_LOCK}}

# Revert only the lazy.nvim lockfile to HEAD.
nvim-plugins-revert-lock:
    git restore -- {{NVIM_LOCK}}
