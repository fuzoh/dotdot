function record_mode
    # Sets the external monitor for recording
    # I use a 3x scaling to create sharp videos in 4k that are nice to watch on mobile
    set display (hyprctl monitors all -j | jq -r 'reverse | .[] | "\(.name)"' | tofi)

    hyprctl keyword monitor $display,3840x2160,auto-up,3
end
