function extend_presentation
    hyprctl keyword monitor eDP-1,3840x2400,0x0,1
    hyprctl keyword monitor HDMI-A-1,preferred,auto,2
    hyprctl keyword workspace 10,monitor:HDMI-A-1,default:true
end
