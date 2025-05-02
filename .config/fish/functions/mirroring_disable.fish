function mirroring_disable
    hyprctl keyword monitor eDP-1, disable
    hyprctl keyword monitor eDP-1, prefered, 0x0, 2
    hyprctl keyword monitor HDMI-A-1, 3840x2160@60, auto-right, 3
    pkill waybar
    waybar & disown
end
