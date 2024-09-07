function open_terminal_in_folder
    read fromstdin
    foot --hold fish -C "z $fromstdin"
end
