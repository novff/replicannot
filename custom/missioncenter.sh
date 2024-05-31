sudo mv /bin/gnome-system-monitor /bin/gnome-system-monitor-back
yay -S --quiet --noconfirm mission-center
sudo ln -s /bin/missioncenter /bin/gnome-system-monitor
