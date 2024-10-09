function 1200_mirror
    hyprctl keyword monitor eDP-1,1920x1200,0x0,1
    hyprctl keyword monitor HDMI-A-1,1920x1200,0x0,1,mirror,eDP-1
end
