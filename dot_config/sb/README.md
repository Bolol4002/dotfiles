Perfect! Let’s make a **clean, detailed README.md** for your new `sb` CLI so you can always reference it. I’ll include all current commands, usage, and tips for Neovim.

Save this as `~/second_brain/README.md` or in your `.config/sb` folder.

---

```markdown
# sb CLI - Simple Second Brain

`sb` is a lightweight command-line interface (CLI) for managing your personal knowledge base stored in Markdown files. Inspired by Zettelkasten workflows, it allows you to quickly create, open, and search notes while keeping everything organized in your "second brain" folder.

## 📂 Folder Structure

Your brain folder is located at:

```

$HOME/second_brain

```

Default directories:

```

second_brain/
├── daily-notes/       # Daily notes (YYYY-MM-DD.md)
├── weekly-notes/      # Weekly notes folders (YYYY-Www/index.md)
├── templates/         # Optional templates for notes
└── other markdown files

````

You can change the location by editing the `BRAIN` variable in `~/.config/sb/sb`.

---

## ⚡ Commands

### 1. `sb`
Go to the brain directory and start a shell session there.

```bash
sb
````

### 2. `sb day`

Open today's daily note. If it doesn't exist, it will be created automatically:

```bash
sb day
```

The daily note filename format:

```
daily-notes/YYYY-MM-DD.md
```

---

### 3. `sb week`

Open this week’s note folder. If it doesn't exist, it will be created:

```bash
sb week
```

The weekly folder format:

```
weekly-notes/YYYY-Www/index.md
```

---

### 4. `sb new "TITLE"`

Create a new note with the specified title:

```bash
sb new "My New Idea"
```

* The filename will include the current date:

  ```
  YYYY-MM-DD-My_New_Idea.md
  ```
* Automatically adds a link to today’s daily note.
* Opens the note in **Neovim**.

---

### 5. `sb fzf`

Fuzzy search any file in your brain and open it in Neovim:

```bash
sb fzf
```

* Requires [fzf](https://github.com/junegunn/fzf) to be installed.
* Great for quickly navigating large collections of notes.

---

### 6. `sb rg SEARCH`

Search inside all notes using ripgrep:

```bash
sb rg "keyword or phrase"
```

* Requires [ripgrep](https://github.com/BurntSushi/ripgrep) to be installed.
* Very fast search across thousands of Markdown files.

---

## ⚙️ Configuration

* Editor: Neovim is default (`nvim`). Change `$EDITOR` or `$VISUAL` if desired.
* Daily notes: `$DAILY_DIR`
* Weekly notes: `$WEEKLY_DIR`
* Templates: `$TEMPLATE_DIR` (optional)

You can set these in `~/.bashrc`:

```bash
export EDITOR="nvim"
export VISUAL="nvim"
export ZETTELKASTEN="$HOME/second_brain"
```

---

## 🔧 Requirements

* `bash`
* `nvim` (or any editor you prefer)
* `fzf` (for fuzzy search)
* `ripgrep` (for searching note contents)

---

## 📝 Notes

* All new notes are Markdown files.
* Daily and weekly notes are automatically created if they don’t exist.
* New notes are automatically linked to the current daily note for better tracking.
* Fuzzy search and ripgrep help navigate and search your knowledge base quickly.

---

## 📌 Example Workflow

```bash
# Go to your brain
sb

# Open today's note
sb day

# Create a new note
sb new "My Research Idea"

# Fuzzy search a note
sb fzf

# Search for "algorithm" in all notes
sb rg "algorithm"

# Open this week’s note
sb week
```

---

This CLI is fully customizable and acts as a terminal-based Zettelkasten system for your personal knowledge base.

```

---

If you want, I can also **add links in this README** so that it **auto-generates a mini “graph-like index” of all your notes** inside your terminal using `sb fzf`. This makes it almost like a CLI Obsidian dashboard.  

Do you want me to do that next?
```

