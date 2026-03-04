# Neovim Config — Doom Emacs Inspired

A full-featured Neovim config mirroring your Doom Emacs workflow.

## Install

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Copy this config
cp -r nvim/ ~/.config/nvim

# Open Neovim — Lazy will auto-install all plugins on first launch
nvim
```

After first launch, run `:Mason` to install extra tools (black, clang-format, stylua).

---

## Keybindings Reference  (SPC = Space)

### Top Level
| Key | Action |
|-----|--------|
| `SPC SPC` | Command palette (like M-x) |
| `SPC .` | Find file (like Emacs `find-file`) |
| `SPC TAB TAB` | Toggle comment |

### Find / Files (`SPC f`)
| Key | Action |
|-----|--------|
| `SPC f f` | Find file |
| `SPC f r` | Recent files |
| `SPC f g` | Live grep |
| `SPC f b` | Browse files (telescope file browser) |
| `SPC f c` | Find in Neovim config |
| `SPC f t` | **Project file tree** (NeoTree at project root) |

### Buffers (`SPC b`)
| Key | Action |
|-----|--------|
| `SPC b b` | Switch buffer |
| `SPC b k` | Kill buffer |
| `SPC b n / p` | Next / Prev buffer |
| `SPC b r` | Reload buffer |
| `Tab / S-Tab` | Cycle buffers |

### Windows (`SPC w`)
| Key | Action |
|-----|--------|
| `SPC w c` | Close window |
| `SPC w n` | New window |
| `SPC w s` | Horizontal split |
| `SPC w v` | Vertical split |
| `SPC w h/j/k/l` | Navigate windows |
| `SPC w w` | Goto next window |

### Toggle (`SPC t`)
| Key | Action |
|-----|--------|
| `SPC t e` | **Toggle eshell** (floating terminal) |
| `SPC t v` | Toggle vertical terminal |
| `SPC t h` | Toggle horizontal terminal |
| `SPC t t` | **Toggle NeoTree** (file tree) |
| `SPC t l` | Toggle line numbers |
| `C-\` | Toggle last terminal (any mode) |
| `Esc Esc` | Exit terminal mode |

### Marks / Bookmarks  (`SPC m`) — Harpoon v2
| Key | Action |
|-----|--------|
| `SPC m a` | Add current file as bookmark |
| `SPC m m` | Open bookmark menu (edit/remove) |
| `SPC m d` | **Bookmark a directory** (telescope picker) |
| `SPC m 1-4` | Jump to bookmark 1–4 |
| `SPC m n / p` | Next / Prev bookmark |

### Git (`SPC g`)
| Key | Action |
|-----|--------|
| `SPC g s` | Git status (fugitive) |
| `SPC g b` | Branches |
| `SPC g c` | Commits |
| `SPC g d` | Diff hunk |
| `SPC g p` | Preview hunk |
| `SPC g r` | Reset hunk |

### LSP / Diagnostics (`SPC e`)
| Key | Action |
|-----|--------|
| `SPC e d` | Diagnostics list (Trouble) |
| `SPC e f` | Format buffer |
| `SPC e r` | Rename symbol |
| `SPC e a` | Code actions |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `[d / ]d` | Prev / Next diagnostic |

### Help (`SPC h`)
| Key | Action |
|-----|--------|
| `SPC h d` | Dashboard |
| `SPC h m` | Mason (LSP installer) |
| `SPC h l` | Lazy (plugin manager) |
| `SPC h c` | Health check |

### Org (`SPC o`)
| Key | Action |
|-----|--------|
| `SPC o a` | Org agenda |
| `SPC o c` | Org capture |

---

## Clipboard Fix
`opt.clipboard = "unnamedplus"` is set so yanking always goes to the system
clipboard. If you're on Wayland install `wl-clipboard`; on X11 install `xclip`
or `xsel`. On macOS this works out of the box via `pbcopy`.

```bash
# Wayland
sudo pacman -S wl-clipboard   # or: sudo apt install wl-clipboard
# X11
sudo pacman -S xclip
```

## Language Support
- **C / C++** — clangd (auto-installed via Mason)
- **Python** — pyright + black formatter
- **Verilog / SystemVerilog** — `svls` (install via `:Mason` or `cargo install svls`)
- **Lua** — lua_ls (for editing this config)

## Dashboard Shortcuts (start screen)
| Key | Action |
|-----|--------|
| `f` | Find file |
| `r` | Recent files |
| `p` | Projects |
| `b` | Bookmarks (Harpoon menu) |
| `a` | Org agenda |
| `c` | Edit Neovim config |
| `g` | Grep |
| `l` | Lazy |
| `q` | Quit |
