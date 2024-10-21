function reset_display
    hyprctl keyword monitor eDP-1,3840x2400,0x0,2
    hyprctl keyword monitor HDMI-A-1,prefered,auto,auto
    hyprctl keyword monitor DP-8,prefered,auto,auto
    hyprctl keyword monitor DP-9,prefered,auto,auto
end
