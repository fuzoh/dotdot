function set_mirror_display
    hyprctl keyword monitor eDP-1,1920x1080,0x0,1
    hyprctl keyword monitor ,1920x1080,0x0,1,mirror,eDP-1
end
