function taskwarrior_add_from_stdin
    read task
    set splittedTask (string split ' ' $task)
    task add $splittedTask
end
