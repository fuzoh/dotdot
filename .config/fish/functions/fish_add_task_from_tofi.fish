function fish_add_task_from_tofi

    cat /dev/null | tofi --prompt-text "Task : " | taskwarrior_add_from_stdin

end
