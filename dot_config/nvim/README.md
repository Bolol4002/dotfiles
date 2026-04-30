# Neovim Configuration

Keybinds documentation for this Neovim setup.

## Leader Key

`<Space>` - Global leader key

---

## General

| Keybind | Action |
|---------|--------|
| `<Space>c` | Clear search highlights |
| `Y` | Yank to end of line |
| `J` | Join lines and keep cursor position |

---

## Search Navigation

| Keybind | Action |
|---------|--------|
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |
| `<C-d>` | Half page down (centered) |
| `<C-u>` | Half page up (centered) |

---

## Window Navigation

| Keybind | Action |
|---------|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |

---

## Window Management

| Keybind | Action |
|---------|--------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

---

## Buffer Navigation

| Keybind | Action |
|---------|--------|
| `<Space>bn` | Next buffer |
| `<Space>bp` | Previous buffer |
| `<Space>bo` | Close all buffers except current |
| `<Space>bd` | Smart close buffer/tab |

---

## Tab Navigation

| Keybind | Action |
|---------|--------|
| `<Space>tn` | New tab |
| `<Space>tx` | Close tab |
| `<Space>tm` | Move tab |
| `<Space>t>` | Move tab right |
| `<Space>t<` | Move tab left |
| `<Space>tO` | Open file in new tab |
| `<Space>td` | Duplicate current tab |
| `<Space>tr` | Close tabs to the right |
| `<Space>tL` | Close tabs to the left |

---

## Editing

| Keybind | Action |
|---------|--------|
| `<Space>p` | Paste without yanking (visual mode) |
| `<Space>d` | Delete without yanking |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |
| `<A-j>` | Move selection down (visual mode) |
| `<A-k>` | Move selection up (visual mode) |
| `<` | Indent left and reselect |
| `>` | Indent right and reselect |

---

## File Operations

| Keybind | Action |
|---------|--------|
| `<Space>e` | Open file explorer |
| `<Space>ff` | Find file |
| `<Space>rc` | Edit config |
| `<Space>rl` | Reload config |
| `<Space>rr` | Rename current file |
| `<Space>pf` | Copy full file path |
| `<Space>pr` | Copy relative file path |
| `<Space>pa` | Copy full file path to clipboard |

---

## Floating Terminal

| Keybind | Action |
|---------|--------|
| `<Space>t` | Toggle floating terminal |
| `<Esc>` | Close floating terminal (in terminal mode) |

---

## LSP (Language Server Protocol)

| Keybind | Action |
|---------|--------|
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `K` | Hover |
| `gi` | Go to implementation |
| `<C-k>` | Signature help |
| `<Space>D` | Go to type definition |
| `<Space>rn` | Rename |
| `<Space>ca` | Code action |
| `gr` | References |
| `<Space>f` | Format code |
| `pd` | Previous diagnostic |
| `nd` | Next diagnostic |
| `<Space>q` | Open diagnostic list |
| `<Space>dl` | Show line diagnostics |

---

## Mouse Support

- Mouse is enabled (`a` mode) - can click to move cursor, select text, resize windows

---

## Supported Languages

| Language | Tab Size | Shift Width | Expand Tabs |
|----------|----------|-------------|-------------|
| Lua | 4 | 4 | Yes |
| Python | 4 | 4 | Yes |
| Java | 4 | 4 | Yes |
| C/C++ | 2 | 2 | Yes |
| Verilog/SystemVerilog | 2 | 2 | Yes |
| JavaScript/TypeScript | 2 | 2 | Yes |
| JSON/HTML/CSS | 2 | 2 | Yes |