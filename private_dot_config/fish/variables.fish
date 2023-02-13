# Force tmux to start in utf8 https://github.com/wernight/powerline-web-fonts/issues/8
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

set -gx EDITOR "nvim"
set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --follow --ignore-file '/home/ayo/.vimignore'"

# Path stuff
set PATH /usr/local/bin $PATH
set -gx PATH $PATH "$HOME/bin" # temporary executables
set -gx PATH $PATH "$HOME/.local/bin"

# Go
set -gx PATH $PATH "/usr/local/go/bin"
set -gx PATH $PATH "$HOME/go/bin"
set -gx GOBIN "$HOME/go/bin"
set -gx GOPATH "$HOME/go"
set -gx GOROOT "/usr/local/go"
set -Ux GO111MODULE "on"

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
set -gx BAT_THEME "gruvbox-dark"

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH $PATH "$VOLTA_HOME/bin"

set -gx PAGER "less"
set -gx PSQL_PAGER "pspg -s 11"

set -gx PATH $PATH "$HOME/.pub-cache/bin"

# Android
set -gx ANDROID_HOME "$HOME/Android"
