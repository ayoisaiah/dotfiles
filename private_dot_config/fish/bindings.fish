if status is-interactive
    # Set the cursor shapes for the different vi modes.
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block

    # Set vi bindings as default
    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end

    fish_user_key_bindings

    set fish_vi_force_cursor 1
end

bind \e\[A 'history --merge ; up-or-search'

fzf_configure_bindings --directory=\cf
