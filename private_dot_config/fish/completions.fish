# Setup python argcomplete for Ansible (only if register-python-argcomplete is available)
if type -q register-python-argcomplete
    for cmd in ansible ansible-config ansible-console ansible-doc ansible-galaxy ansible-inventory ansible-playbook ansible-pull ansible-vault
        register-python-argcomplete --shell fish $cmd | source
    end
end
