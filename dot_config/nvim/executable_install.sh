#!/usr/bin/env bash
# Quick install script
set -e

BACKUP=~/.config/nvim.bak.$(date +%s)

if [ -d ~/.config/nvim ]; then
  echo "Backing up existing config to $BACKUP"
  mv ~/.config/nvim "$BACKUP"
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp -r "$SCRIPT_DIR" ~/.config/nvim
echo "Config installed to ~/.config/nvim"
echo ""
echo "  1. Open nvim — Lazy will install all plugins automatically"
echo "  2. Run :Mason to install LSP servers / formatters"
echo "  3. For Verilog LSP: :MasonInstall svls"
echo ""
echo "Clipboard fix: make sure wl-clipboard (Wayland) or xclip (X11) is installed."
