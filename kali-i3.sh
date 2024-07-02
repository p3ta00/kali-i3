# Update and Upgrade
sudo apt update && sudo apt upgrade -y

# Install Fonts
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip -P ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip -P ~/.local/share/fonts/
unzip ~/.local/share/fonts/Iosevka.zip -d ~/.local/share/fonts/
unzip ~/.local/share/fonts/RobotoMono.zip -d ~/.local/share/fonts/
fc-cache -fv

# Install Kitty
sudo apt install -y kitty

# Install Dependencies for Picom
sudo apt install -y meson ninja-build gcc libxext-dev libxcb1-dev libxcb-damage0-dev \
libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev \
libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev

# Clone the Picom Repository
git clone https://github.com/yshui/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Create Configuration Directories
mkdir -p ~/.config/i3 ~/.config/kitty ~/.config/nvim ~/.config/picom ~/.config/polybar ~/.config/rofi

# Copy Configuration Files
cp config/i3/config ~/.config/i3/config
cp -r config/kitty ~/.config/kitty
cp -r config/nvim ~/.config/nvim
cp -r config/picom ~/.config/picom
cp -r config/polybar ~/.config/polybar
cp -r config/rofi ~/.config/rofi
cp -r config/.tmux ~/.tmux
cp config/launch_polybar.sh ~/launch_polybar.sh
cp config/starship.toml ~/starship.toml
cp .tmux.conf ~/.tmux.conf
cp .zshrc ~/.zshrc
cp -r .oh-my.zsh ~/.oh-my-zsh

# Install i3-gaps
sudo apt install -y kali-desktop-i3-gaps
