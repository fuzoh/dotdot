function taskwarrior_add_jt_from_stdin
    read task
    set splittedTask (string split ' ' $task)
    task add +j $splittedTask
end
