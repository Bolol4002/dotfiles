Understood. Tools first, aesthetics later — the order of any serious operator.

On **Ubuntu**, install the required components with the commands below.

---

## Install Waybar

Waybar is the status bar for Wayland compositors like Sway.

```bash
sudo apt update
sudo apt install waybar
```

---

## Install Brightness Control Utility

Provides control for screen backlight.

```bash
sudo apt install brightnessctl
```

If brightness keys don’t work afterward:

```bash
sudo chmod +s /usr/bin/brightnessctl
```

---

## Install Audio Control (pactl)

### ✔ Recommended: PipeWire (modern audio stack)

Most newer Ubuntu versions use PipeWire.

```bash
sudo apt install pipewire pipewire-audio-client-libraries wireplumber
```

Then reboot or start services:

```bash
systemctl --user --now enable wireplumber
```

---

### ✔ Alternative: PulseAudio (older but still common)

```bash
sudo apt install pulseaudio-utils
```

This provides the `pactl` command used in your keybindings.

---

## Verify Installation

Check everything is available:

```bash
waybar --version
brightnessctl
pactl info
```
