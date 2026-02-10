# --- Shell & Environment ---
set -g fish_greeting
set -x GPG_TTY (tty)
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

# OS specific setup
if test (uname -s) = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# --- Default Apps ---
set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR $EDITOR
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx PSQL_PAGER "pspg -s 11"
set -gx SUDO_EDITOR "$HOME/.local/share/bob/nvim-bin/nvim"

# --- General Paths ---
fish_add_path /usr/local/bin
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"

# --- Language SDKs ---
# Go
set -gx GOPATH "$HOME/go"
set -gx GOROOT /usr/local/go
set -gx GOBIN "$GOPATH/bin"
set -Ux GO111MODULE on
fish_add_path /usr/local/go/bin
fish_add_path "$GOBIN"

# Rust
fish_add_path "$HOME/.cargo/bin"

# Deno
set -gx DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"

# JavaScript / Node
fish_add_path "$HOME/.bun/bin"

# .NET
set -gx DOTNET_ROOT "$HOME/.dotnet"
fish_add_path "$DOTNET_ROOT"

# --- Tool Configuration ---
# FZF
set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --follow --ignore-file '$HOME/.vimignore'"
set fzf_preview_dir_cmd eza --all --color=always
set fzf_fd_opts --hidden --follow --ignore-file "$HOME/.vimignore"

# Bat
set -gx BAT_THEME gruvbox-dark

# Mise
set -gx MISE_NPM_BUN true
fish_add_path "$HOME/.local/share/mise/shims"

# NVIM (Bob)
fish_add_path "$HOME/.local/share/bob/nvim-bin"

