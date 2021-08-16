git clone https://github.com/karlstav/cava
cd cava
./autogen.sh
./configure
make
sudo make install
cd

sudo pacman -Syyu git base-devel xorg alacritty i3-gaps dmenu rofi picom redshift nitrogen polybar fftw ncurses alsa-lib iniparser pulseaudio xorg-fonts-misc plasma
yay -Syyu siji-git ttf-unifont
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd


mkdir dotfiles
cd dotfiles
git clone https://github.com/NachoCheez/.config

mkdir ~/.config/alacritty
cp -r ~/dotfiles/.config/alacritty ~/.config/
cd

mkdir ~/.config/i3
cp -r ~/dotfiles/.config/i3 ~/.config/
cd

mkdir ~/.config/polybar
cp -r ~/dotfiles/.config/polybar ~/.config
cd
