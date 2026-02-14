# dotfiles
My dotfiles

# These are my dotfiles
Currently
- wofi
- mango
- fastfetch
- sway
- waybar

---
### Initialize from repo

```
chezmoi init https://github.com/Bolol4002/dotfiles.git   # clone dotfiles into chezmoi source dir
```

### Preview changes

```
chezmoi diff                                             # show what will be modified
```

### Apply configuration

```
chezmoi apply                                            # deploy files to $HOME
chezmoi apply --verbose                                  # apply with script/output details
```

### Source & deploymente Directory

```
~/.local/share/chezmoi                                   # source of truth
~/                                                       # deployed files location
```

### View managed files

```
chezmoi managed                                          # list files under chezmoi control
chezmoi list                                             # show deployed targets
```

### Edit managed files

```
chezmoi edit ~/.bashrc                                   # edit source version safely
chezmoi edit ~/.config/sway/config                       # edit sway config
chezmoi apply                                            # apply changes
```

### Add new files

```
chezmoi add ~/.config/waybar/config                      # add file to chezmoi
chezmoi add ~/.bash_aliases                              # add aliases
chezmoi add ~/.gitconfig                                 # add git config
```

### Update source after manual edit

```
chezmoi add ~/.config/waybar/config                      # refresh source copy
```

### Update from remote repo

```
chezmoi update                                           # pull & apply updates
```

### Inspect source directory

```
cd ~/.local/share/chezmoi                                # open source directory
ls                                                       # list contents
```

### Diagnostics

```
chezmoi doctor                                           # show config paths & health
```

### Naming conventions (source dir)

```
dot_        → hidden file
executable_ → executable
private_    → encrypted/private
*.tmpl      → template
run_once_   → run once
run_onchange_ → run when modified
```

### Safe workflow

```
chezmoi diff                                             # preview after cloning
chezmoi apply                                            # deploy
chezmoi add ~/.path/to/file                              # add new config
chezmoi edit ~/.file                                     # edit safely
chezmoi apply                                            # redeploy
chezmoi update                                           # sync from repo
```

---

Some of them are not original.
