# Aliases
source $HOME/.config/fish/aliases.fish

# Abbreviations
source $HOME/.config/fish/abbr.fish

# Force tmux to start in utf8 https://github.com/wernight/powerline-web-fonts/issues/8
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

set -gx EDITOR "nvim"
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --ignore-file '/home/ayo/.vimignore'"

# PATH
set PATH /usr/local/bin $PATH

set -gx PATH $PATH "$HOME/bin"
set -gx PATH $PATH "$HOME/.local/bin"
set -gx PATH $PATH "/home/ayo/.yarn/bin"

## Golang
set -gx PATH $PATH "/usr/local/go/bin"
set -gx PATH $PATH "$HOME/go/bin"
set -gx GOBIN "$HOME/go/bin"
set -gx GOPATH "$HOME/go"
set -gx GOROOT "/usr/local/go"
set -Ux GO111MODULE "on"

## Ruby
set -gx PATH $PATH "$HOME/.rbenv/bin"
set -gx PATH $PATH "$HOME/.rbenv/plugins/ruby-build/bin"
status --is-interactive; and rbenv init - fish | source

## Rust
set -gx PATH $PATH "/home/ayo/.cargo/bin"

## Deno
set -gx DENO_INSTALL "/home/ayo/.deno"

# SHELL
zoxide init fish | source # Better cd

starship init fish | source # Universal shell prompt
