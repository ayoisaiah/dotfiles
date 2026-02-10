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
