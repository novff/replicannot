cwd=$(pwd)
df=$cwd/configs/dotfiles

#extract in-repo packages
pacman -Qn |cut -f 1 -d " "  > ./pkg.txt

#extract aur packages
pacman -Qm |cut -f 1 -d " " > ./aur.txt

#extract gnome extensions
#gnome-extensions list -d> ./gnomeext.txt
cp -r ~/.local/share/gnome-shell/extensions/ ./extensions

#extract settings for desktop via dconf
dconf dump / > dconf.txt

#backup dotfiles and configurations
cp ~/.zshrc $df
cp -r ~/.themes $df
cp -r ~/Templates $cwd/configs/Templates


git add .

