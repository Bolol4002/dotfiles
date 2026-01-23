#!/bin/bash

# Define repository URL
REPO_URL="https://gitlab.com/sayoojsumesh1112/my_configs"
CONFIG_DIR="$HOME/.config"

echo "INSTALLATION ABOUT TO BEGIN"
echo "BY SAYOOJ "
echo "Updating system and installing necessary packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git qtile rofi picom feh python-psutil

# Install yay (if not installed)
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
fi

# Install qtile-extras using yay
yay -S --noconfirm qtile-extras

# Clone or update configuration repository
if [ -d "$CONFIG_DIR/my_configs" ]; then
    echo "Updating existing configuration repository..."
    cd "$CONFIG_DIR/my_configs" || exit
    git pull
else
    echo "Cloning configuration repository..."
    git clone "$REPO_URL" "$CONFIG_DIR/my_configs"
fi

# Copy Qtile config
echo "Applying Qtile configuration..."
mkdir -p "$CONFIG_DIR/qtile"
cp -r "$CONFIG_DIR/my_configs/qtile/"* "$CONFIG_DIR/qtile/"

# Install Nerd Fonts (JetBrainsMono)
FONT_DIR="$HOME/.local/share/fonts/JetBrainsMono"
mkdir -p "$FONT_DIR"
echo "Installing JetBrainsMono Nerd Font..."
cp -r "$CONFIG_DIR/my_configs/JetBrainsMono/"* "$FONT_DIR/"
fc-cache -fv  # Refresh font cache

echo "Qtile installation complete. Please log out and select Qtile in your login manager."


