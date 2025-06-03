set LANG en_US.UTF-8

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

# SHELL
zoxide init fish | source # Better cd

starship init fish | source

mise activate fish | source

source $HOME/.atuin/bin/env.fish

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# Setup python argcomplete for Ansible
for cmd in ansible ansible-config ansible-console ansible-doc ansible-galaxy ansible-inventory ansible-playbook ansible-pull ansible-vault
    register-python-argcomplete --shell fish $cmd | source
end

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            echo '🟡 '
        case insert
            echo '🟢 '
        case replace_one
            echo '🔵 '
        case visual
            echo '🟣 '
        case '*'
            echo '🔴 '
    end
end
