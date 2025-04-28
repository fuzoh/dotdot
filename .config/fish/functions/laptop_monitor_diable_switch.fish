function laptop_monitor_diable_switch
    set -l monitor_status (hyprctl monitors all -j | jq '.[0].disabled')
    switch $monitor_status
        case true
            hyprctl keyword monitor eDP-1, prefered, auto-down, 2
        case false
            hyprctl keyword monitor eDP-1, disabled
    end
end
