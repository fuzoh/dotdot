function set_extend_presentation
    hyprctl keyword monitor eDP-1,1920x1200,0x0,1
    hyprctl keyword monitor ,preferred,auto,auto
    hyprctl keyword workspace 9,monitor:DP-9,default:true
end
