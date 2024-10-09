function fish_add_jt_task_from_tofi

    cat /dev/null | tofi --prompt-text "Jt : " | taskwarrior_add_jt_from_stdin

end
