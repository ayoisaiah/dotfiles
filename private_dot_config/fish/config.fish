# Aliases
source $HOME/.config/fish/aliases.fish

# Abbreviations
source $HOME/.config/fish/abbr.fish

# Variables
source $HOME/.config/fish/variables.fish

# Key bindings
source $HOME/.config/fish/bindings.fish

## Fzf.fish
set fzf_preview_dir_cmd exa

set fzf_fd_opts --hidden --follow --ignore-file '/home/ayo/.vimignore'

# SHELL
zoxide init fish | source # Better cd
