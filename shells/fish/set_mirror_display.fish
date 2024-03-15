function set_mirror_display
    hyprctl keyword monitor eDP-1,1920x1080,0x0,1
    hyprctl keyword monitor DP-9,1920x1080,auto,auto,mirror,eDP-1
end
