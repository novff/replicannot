cwd=$(pwd)
df=$cwd/configs/dotfiles

#install packages from arch repo which are explicitly found in repo
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -S --noconfirm --needed< packages.txt

#install yay-bin
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin
makepkg -si
cd ..

#install packages from yay
yay -S $(cat aur.txt)

#restore settings from dconf
dconf load / < dconf.txt

#emplace dotfiles
cp $df/.zshrc ~/
cp -r $df/.themes ~/