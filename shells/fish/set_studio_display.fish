function set_studio_display
    swaymsg output DP-7 disable
    swaymsg output DP-6 enable
    swaymsg output DP-6 mode 5120x2880
    swaymsg output DP-6 scale 2
    swaymsg output DP-6 pos 0 0
    swaymsg output eDP-1 pos 300 1440
end
