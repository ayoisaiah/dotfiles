# Aliases
source $HOME/.config/fish/aliases.fish

# Abbreviations
source $HOME/.config/fish/abbr.fish

# Variables
source $HOME/.config/fish/variables.fish

# Key bindings
source $HOME/.config/fish/bindings.fish

# Kanagawa theme
source $HOME/.config/fish/extras/kanagawa.fish

## Fzf.fish
set fzf_preview_dir_cmd exa

set fzf_fd_opts --hidden --follow --ignore-file '/home/ayo/.vimignore'

# SHELL
zoxide init fish | source # Better cd

starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ayo/.local/bin/google-cloud-sdk/path.fish.inc' ]; . '/home/ayo/.local/bin/google-cloud-sdk/path.fish.inc'; end

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

set -gx PNPM_HOME "/home/ayo/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Setup python argcomplete for Ansible
for cmd in ansible ansible-config ansible-console ansible-doc ansible-galaxy ansible-inventory ansible-playbook ansible-pull ansible-vault; register-python-argcomplete --shell fish $cmd | source; end
