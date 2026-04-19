## Fix it step-by-step
### 1. Create the directory

```bash
mkdir -p ~/bin
```

---

### 2. Move the script

```bash
mv ~/.config/executable_gitpush.sh ~/bin/push
```

---

### 3. Make it executable

```bash
chmod +x ~/bin/push
```

---

### 4. Ensure PATH includes it

Check:

```bash
echo $PATH
```

If `~/bin` is missing:

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

### 5. Run it

```bash
push
```
---
## If it still doesnât work
Run:
```bash
which push
```
* If it shows `/home/sayooj/bin/push` â you're good

---

