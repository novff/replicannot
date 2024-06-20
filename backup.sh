cwd=$(pwd)
df=$cwd/configs/dotfiles

#extract arch-repo packages
	pacman -Qn |cut -f 1 -d " "  > ./pkg.txt
#extract aur packages
	pacman -Qm |cut -f 1 -d " " > ./aur.txt
#extract flatpaks
	#flatpak list --columns=application > ./flat.txt
	sudo pacman -S --noconfirm --needed flatpak python python-pip
	pip install --user flatpak-sync --break-system-packages
	~/.local/bin/flatpak-sync generate -v
	cp -r ~/.config/flatpak-sync/flatpak.json ./flatpack.json 
#extract snaps
	#how doe
#extract gnome extensions
#gnome-extensions list -d> ./gnomeext.txt
	cp -r ~/.local/share/gnome-shell/extensions/ ./

#extract settings for desktop via dconf
	dconf dump / > dconf.txt

#backup dotfiles and configurations
	cp ~/.zshrc $df
	cp -r ~/.themes $df
	cp -r ~/.icons $df
	cp -r ~/Templates $cwd/configs/

#github automation
	git add .
	git commit -m "automatic backup exec commit"
	#git push origin

