#!/usr/bin/env bash

set -e

REPO="https://github.com/Bolol4002/dotfiles.git"
LOG_FILE="/tmp/dotfiles-install.log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}==>${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

error() {
    echo -e "${RED}ERROR:${NC} $1" >&2
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG_FILE"
    exit 1
}

warn() {
    echo -e "${YELLOW}WARNING:${NC} $1"
}

# Prevent root execution
[ "$EUID" -eq 0 ] && error "Do not run as root"

log "Starting dotfiles installation..."

# Optional system update
read -rp "Update system packages first? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    log "Updating system..."
    sudo pacman -Syu --noconfirm
fi

log "Installing base dependencies..."
sudo pacman -S --needed --noconfirm \
    git base-devel curl wget

# Install chezmoi if missing
if ! command -v chezmoi >/dev/null 2>&1; then
    log "Installing chezmoi..."
    sudo pacman -S --needed --noconfirm chezmoi
fi

log "Choose your Window Manager:"
echo "1) sway"
echo "2) mango"
read -rp "Enter choice [1-2]: " WM_CHOICE

[[ "$WM_CHOICE" =~ ^[12]$ ]] || error "Invalid selection"

# Common packages
COMMON_PKGS=(
    ghostty
    rofi-wayland
    waybar
    mako
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard
    brightnessctl
    pipewire
    pipewire-pulse
    alsa-utils
    python-pywal
    swaybg
    ranger
    emacs
    networkmanager
    ttf-font-awesome
    pavucontrol
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    seatd
    polkit-gnome
    xdg-user-dirs
)

install_common() {
    log "Installing common packages..."
    sudo pacman -S --needed --noconfirm "${COMMON_PKGS[@]}"
}

install_sway() {
    log "Installing sway..."
    sudo pacman -S --needed --noconfirm sway swaynag
}

install_mango() {
    log "Installing mango (AUR)..."

    if ! command -v yay >/dev/null 2>&1; then
        log "Installing yay..."
        git clone --depth 1 https://aur.archlinux.org/yay.git /tmp/yay
        pushd /tmp/yay >/dev/null
        makepkg -si --noconfirm
        popd >/dev/null
        rm -rf /tmp/yay
    fi

    log "Installing mangowm..."
    yay -S --needed --noconfirm mangowm

    if command -v mango >/dev/null 2>&1 || command -v mangowm >/dev/null 2>&1; then
        log "mango installed"
    else
        warn "mango installed but binary not found in PATH"
    fi
}

case "$WM_CHOICE" in
    1)
        install_common
        install_sway
        ;;
    2)
        install_common
        install_mango
        ;;
esac

# Safe backup (only relevant configs)
backup_dotfiles() {
    local backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d_%H%M%S)"
    log "Backing up relevant configs to $backup_dir"

    CONFIG_DIRS=(mango sway waybar rofi ghostty nvim ranger)

    for dir in "${CONFIG_DIRS[@]}"; do
        if [ -e "$HOME/.config/$dir" ]; then
            mkdir -p "$backup_dir/.config"
            mv "$HOME/.config/$dir" "$backup_dir/.config/"
            log "Backed up .config/$dir"
        fi
    done

    for file in .bashrc .zshrc .gitconfig; do
        if [ -e "$HOME/$file" ]; then
            mv "$HOME/$file" "$backup_dir/"
            log "Backed up $file"
        fi
    done
}

backup_dotfiles

log "Initializing chezmoi..."
chezmoi init "$REPO"

# Optional diff preview
read -rp "Preview changes? [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    chezmoi diff
    read -rp "Apply these changes? [y/N]: " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] || error "Aborted"
fi

log "Applying dotfiles..."
chezmoi apply

log "Enabling NetworkManager..."
sudo systemctl enable --now NetworkManager

log "Setup complete"

echo "====================================="
echo "Next steps:"
echo "- Log out"
echo "- From TTY, launch:"
echo "    sway"
echo "    mango"
echo "- Generate colors:"
echo "    wal -i /path/to/wallpaper"
echo "- Logs: $LOG_FILE"
echo "====================================="
