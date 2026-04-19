# Mango WM Setup

This config requires the following dependencies.

## Dependencies

### Window Manager & Display
- **mango** - Window manager (from DreamMaoMao/mango)
- **swaybg** - Wallpaper for wayland
- **waybar** - Status bar

### Terminal & Apps
- **ghostty** - Terminal emulator
- **emacs** - Editor
- **ranger** - File manager
- **rofi** - App launcher (with wayland support)
- **librewolf** - Browser
- **nmtui** - Network manager TUI (from NetworkManager)
- **alsamixer** - Audio mixer (from alsa-utils)

### Screenshot & Media
- **grim** - Wayland screenshot tool
- **slurp** - Wayland region selector
- **wl-clipboard** - Wayland clipboard (wl-copy)

### Screen Lock
- **swaylock** - Screen locker

### Utilities
- **brightnessctl** - Brightness control
- **pulseaudio** or **pipewire-pulse** - Audio system (pactl)
- **wal** (pywal16) - Color scheme generator

---

## Arch Linux Install Commands

```bash
# Core dependencies
paru -S mango-hyprland-git swaybg waybar

# Terminal & Apps
paru -S ghostty emacs ranger rofi librewolf networkmanager alsa-utils

# Screenshot & Media
paru -S grim slurp wl-clipboard

# Screen Lock
paru -S swaylock

# Utilities
paru -S brightnessctl pulseaudio pywal16
```

Note: Some packages (like ghostty, librewolf, mango) may be in AUR and require an AUR helper like `paru` or `yay`.

You may also need to enable Pipewire for audio:
```bash
systemctl enable --user pipewire.service
```