# Set vi bindings as default
function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

fish_user_key_bindings

bind \e\[A 'history --merge ; up-or-search'

fzf_configure_bindings --directory=\cf
