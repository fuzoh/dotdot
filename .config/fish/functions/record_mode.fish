function record_mode
    # Sets the external monitor for recording
    # I use a 3x scaling to create sharp videos in 4k that are nice to watch on mobile
    hyprctl keyword monitor DP-1,3840x2160,0x0,3
    # The internal screen stay to 2x scaling to display a prompt or other "backstage" informations (not recorded)
    hyprctl keyword monitor eDP-1,3840x2400,0x720,2
end
