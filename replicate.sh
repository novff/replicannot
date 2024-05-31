cwd=$(pwd)
df=$cwd/configs/dotfiles

#emplace dotfiles and configs
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp $df/.zshrc ~/
	cp -r $df/.themes ~/
	cp -r $df/.icons ~/
	cp -r $cwd/Templates ~/Templates
	cp -r $cwd/flatpack.json ~/.config/flatpak-sync/flatpak.json
#install packages from arch repo which are explicitly found in repo
	sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
	sudo pacman -S --noconfirm --needed - < packages.txt
#install yay-bin
	git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin
	makepkg -si
	cd ..
	rm -rf yay-bin
#install packages from yay
	yay -S --quiet --noconfirm --sudoloop $(cat aur.txt)
#install flatpak and flatpak-sync with its deps
	sudo pacman -S --noconfirm --needed flatpak python python-pip
	pip install --user flatpak-sync --break-system-packages
#install flatpak packages
	flatpak-sync run -v
#emplace gnome extensions
	cp -r $df/extensions ~/.local/share/gnome-shell/extensions/
#restore settings from dconf
	dconf load / < dconf.txt

