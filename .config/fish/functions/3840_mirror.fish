function 3840_mirror
    hyprctl keyword monitor HDMI-A-1,3840x2160,0x0,3
    hyprctl keyword monitor eDP-1,1920x1080,0x0,1,mirror,HDMI-A-1
end