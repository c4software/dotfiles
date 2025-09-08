read -p "Do you want to enable clamshell mode (suspend on lid close if not docked)? (y/n) " enable_clamshell
if [[ $enable_clamshell == [yY] ]]; then
    # If its a laptop (using presence of a battery)
    if [ -f /sys/class/power_supply/BAT0/uevent ]; then
        echo -e "Laptop detected"
        grep -qE '^\s*HandleLidSwitch\s*=' /etc/systemd/logind.conf || echo "HandleLidSwitch=suspend" | sudo tee -a /etc/systemd/logind.conf
        grep -qE '^\s*HandleLidSwitchDocked\s*=' /etc/systemd/logind.conf || echo "HandleLidSwitchDocked=ignore" | sudo tee -a /etc/systemd/logind.conf
    fi
fi