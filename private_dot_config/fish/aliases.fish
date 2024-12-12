alias vim="nvim"

alias vi="/usr/bin/vim"

# Return to the project root (where .git folder is)
alias gcd="cd (git rev-parse --show-toplevel)"

alias n="npm"
alias y="yarn"
alias p="pnpm"

# Replace ls with eza
alias ls="eza --icons --hyperlink"

alias brl="br -dp"
alias brgs="br -gc :gs"

# Replace cat with bat
alias cat="bat"

# gotestfmt
alias gotestfmt="gotestfmt -hide 'empty-packages'"

alias yt="yt-dlp"

alias pn="pnpm"

alias r="bundle exec rails"

alias py="python3"

alias grep="grep -H -P --color=auto"

alias astro="NVIM_APPNAME=AstroNvim nvim"

alias nv="NVIM_APPNAME=NvChad nvim"

alias lazy="NVIM_APPNAME=LazyVim nvim"

alias aa="NVIM_APPNAME=ArchVim nvim"

# Kitty uses TERM=kitty which causes issues with remote sessions
alias ssh="TERM=xterm-256color command ssh"

alias lss="/usr/bin/ls"

alias fresh="NVIM_APPNAME=FreshVim nvim"
