# Force tmux to start in utf8 https://github.com/wernight/powerline-web-fonts/issues/8
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR $EDITOR
set -gx VISUAL $EDITOR

set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --follow --ignore-file '/home/ayo/.vimignore'"

# Path stuff
set PATH /usr/local/bin $PATH
set -gx PATH $PATH "$HOME/bin" # temporary executables
set -gx PATH "$HOME/.local/bin" $PATH

# Go
set -gx PATH $PATH /usr/local/go/bin
set -gx PATH $PATH "$HOME/go/bin"
set -gx GOBIN "$HOME/go/bin"
set -gx GOPATH "$HOME/go"
set -gx GOROOT /usr/local/go
set -Ux GO111MODULE on

# Ruby
set -gx PATH $PATH "$HOME/.rbenv/bin"
set -gx PATH $PATH "$HOME/.rbenv/plugins/ruby-build/bin"
status --is-interactive; and rbenv init - fish | source

# Rust
set -gx PATH $PATH "/home/ayo/.cargo/bin"

# Deno
set -gx DENO_INSTALL "/home/ayo/.deno"
set -gx PATH $PATH "$DENO_INSTALL/bin"

# Bat
set -gx BAT_THEME gruvbox-dark

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH $PATH "$VOLTA_HOME/bin"

set -gx PAGER less
set -gx PSQL_PAGER "pspg -s 11"

set -gx PATH $PATH "$HOME/.pub-cache/bin"

set -gx PATH $PATH "$HOME/.bun/bin"

# Flutter
set -gx PATH "$HOME/.flutter/bin" $PATH

# Mise
set -gx MISE_NPM_BUN true

# NVIM
set -gx PATH "$HOME/.local/share/bob/nvim-bin" $PATH
set -gx SUDO_EDITOR "/home/user/.local/share/bob/nvim-bin/nvim"

# Android
set -gx ANDROID_HOME "$HOME/Android"

## Fzf.fish
set fzf_preview_dir_cmd eza --all --color=always

set fzf_fd_opts --hidden --follow --ignore-file '/home/ayo/.vimignore'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ayo/.local/bin/google-cloud-sdk/path.fish.inc' ]
    . '/home/ayo/.local/bin/google-cloud-sdk/path.fish.inc'
end

set -gx PNPM_HOME "/home/ayo/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

set -gx PATH $PATH "$HOME/.local/bin/depot-tools"

set -gx PATH /home/ayo/.local/share/mise/shims $PATH

set -x GPG_TTY (tty)
