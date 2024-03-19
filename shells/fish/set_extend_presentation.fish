function set_extend_presentation
    hyprctl keyword monitor eDP-1,1920x1200,0x0,1
    hyprctl keyword monitor HDMI-A-1,preferred,auto,2
    hyprctl keyword workspace 9,monitor:HDMI-A-1,default:true
end
