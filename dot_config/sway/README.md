# 📦 Core System (Sway + Wayland)

* **sway**
* **waybar**
* **mako**
* **swaybg**
* **swayidle**
* **swaylock**

Install:

```bash
sudo pacman -S sway waybar mako swaybg swayidle swaylock
```

---

# 🪟 Terminal + Launcher + File Tools

* **Ghostty**
* **Rofi**
* **ranger**

```bash
sudo pacman -S ghostty rofi ranger
```

---

# 🌐 Applications

* **Firefox**

```bash
sudo pacman -S firefox
```

(or LibreWolf if you prefer privacy-focused)

---

# 🔊 Audio / Volume

You are using `pactl` → requires PipeWire setup:

* **pipewire**
* **wireplumber**

```bash
sudo pacman -S pipewire wireplumber pipewire-pulse
```

---

# 🔆 Brightness Control

* **brightnessctl**

```bash
sudo pacman -S brightnessctl
```

---

# 📸 Screenshots + Clipboard

* **grim**
* **slurp**
* **wl-clipboard**

```bash
sudo pacman -S grim slurp wl-clipboard
```

---

# 🌐 Networking

* **NetworkManager**

```bash
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager --now
```

You use:

* `nmtui` (included with NetworkManager)

---

# 🔐 Locking / Idle

Already covered above:

* swaylock
* swayidle

---

# 🖥️ Fonts (important for UI consistency)

* **JetBrains Mono**
* Noto fonts (emoji + fallback)

```bash
sudo pacman -S ttf-jetbrains-mono noto-fonts noto-fonts-emoji
```

---

# 📁 XDG Portals (Wayland compatibility layer)

* **xdg-desktop-portal-wlr**

```bash
sudo pacman -S xdg-desktop-portal-wlr
```

---

# 🧠 Utilities (used implicitly / good to have)

```bash
sudo pacman -S git unzip p7zip ripgrep fd fzf
```

---

# 📂 Optional but Recommended

* **thunar** (GUI fallback)

```bash
sudo pacman -S thunar
```

---

# 🧾 System Services Checklist (IMPORTANT)

Make sure these are enabled:

```bash
sudo systemctl enable NetworkManager --now
```
