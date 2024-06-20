yay -S nvidia-dkms-beta nvidia-utils-beta lib32-nvidia-utils-beta
sudo sed 's/#WaylandEnable=false/WaylandEnable=true/' /etc/gdm/custom.conf 
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
