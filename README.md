# Zsh Configuration

Modular Zsh setup supporting multiple plugin managers with optimized performance.

## Installation

```bash
# Clone this repo
git clone https://github.com/YOUR_USERNAME/zsh-config.git ~/.zsh

# Run setup to create symlinks (backs up existing files)
~/.zsh/setup.sh

# Copy example secrets file and edit it
cp ~/.zsh/secret.zsh.example ~/.zsh/secret.zsh
# Edit ~/.zsh/secret.zsh with your API keys

# Install Antidote (recommended)
brew install antidote

# Reload shell
exec zsh
```

**Note:** The `setup.sh` script will back up any existing `~/.zshrc` or `~/.zsh_plugins.txt` files with a timestamp suffix (e.g., `.zshrc.bak.20251103_143022`) before creating symlinks.

## Setup Overview

```
~/.zsh/
├── zshrc              # Main config (symlinked from ~/.zshrc)
├── plugins.txt        # Plugin list (symlinked from ~/.zsh_plugins.txt)
├── frameworks/        # Plugin manager configs
│   ├── antidote.zsh   # Fast, simple (ACTIVE)
│   ├── zinit.zsh      # Fastest, complex
│   └── omz.zsh        # Easiest, slowest
├── aliases.zsh        # Command aliases
├── completion.zsh     # Tab completion styling
├── scripts.zsh        # Custom functions
├── utils.zsh          # Utility functions
└── secret.zsh         # Environment variables (gitignored)
```

**Active Config:** `~/.zshrc` and `~/.zsh_plugins.txt` in `$HOME` are symlinks to files in `~/.zsh/`

### Symlink Structure

The actual files live in the `~/.zsh/` directory (this repo), and are linked from your home directory:

```bash
# Configuration
~/.zshrc -> ~/.zsh/zshrc

# Plugin list for Antidote
~/.zsh_plugins.txt -> ~/.zsh/plugins.txt
```

**Why:** Keeps your entire zsh config in one git-tracked directory, while maintaining standard zsh locations in `$HOME`.

### .zshrc

```zsh
## ====== PATHS =========
## set youre path variables (npm, brew, python, tex etc..)
# example:
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"

# =========================
# FRAMEWORKS
# only leave on framework on, other must be commented out !
# =========================

# ZINIT
# source ~/.zsh/frameworks/zinit.zsh

# OMZ
# source ~/.zsh/frameworks/omz.zsh

# ANTIDOTE
source ~/.zsh/frameworks/antidote.zsh


# starship PROMPT
eval "$(starship init zsh)"

# =======================
# load .zsh (loading every root *.zsh file in ~/.zsh/* )
# =======================
for file in ~/.zsh/*.zsh; do
  source "$file"
done


```

---

## Frameworks

### Antidote (Current - ⚡ Fast & Simple)

**Load Time:** ~80-100ms
**Complexity:** Low
**Best For:** Speed without configuration overhead

**Setup:**

1. Install: `brew install antidote`
2. Edit `~/.zsh_plugins.txt` (symlink to `~/.zsh/plugins.txt`) to add/remove plugins
3. Reload shell - auto-regenerates on changes

**Config Files:**

- `~/.zsh/frameworks/antidote.zsh` - Framework loader
- `~/.zsh/plugins.txt` - Plugin list source file (in repo)
- `~/.zsh_plugins.txt` - Symlink to `~/.zsh/plugins.txt`
- `~/.zsh_plugins.zsh` - Auto-generated static file

**To Activate:**

```zsh
# In ~/.zsh/zshrc, uncomment:
source ~/.zsh/frameworks/antidote.zsh

# Comment out others:
# source ~/.zsh/frameworks/zinit.zsh
# source ~/.zsh/frameworks/omz.zsh
```

---

### Zinit (⚡⚡ Fastest - Advanced)

**Load Time:** ~50-70ms
**Complexity:** High
**Best For:** Power users who want maximum control

**Setup:**

1. Auto-installs on first run
2. Edit `~/.zsh/frameworks/zinit.zsh` to configure
3. Supports turbo mode, lazy loading, ice modifiers

**Config Files:**

- `~/.zsh/frameworks/zinit.zsh` - All configuration in one file

**Features:**

- Turbo mode for deferred loading
- Fine-grained plugin control
- Fastest possible startup

**To Activate:**

```zsh
# In ~/.zsh/zshrc, uncomment:
source ~/.zsh/frameworks/zinit.zsh

# Comment out others
```

---

### Oh My Zsh (🐌 Slow - Beginner Friendly)

**Load Time:** ~300-500ms
**Complexity:** Very Low
**Best For:** Beginners, out-of-the-box experience

**Setup:**

1. Install: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
2. Edit `~/.zsh/frameworks/omz.zsh` to configure plugins
3. Handles compinit automatically

**Config Files:**

- `~/.zsh/frameworks/omz.zsh` - Plugin list and theme
- `~/.oh-my-zsh/` - OMZ installation directory

**To Activate:**

```zsh
# In ~/.zsh/zshrc, uncomment:
source ~/.zsh/frameworks/omz.zsh

# Comment out others
```

---

## Prompt

**Current:** Starship (cross-shell prompt)

**Load Time:** ~5-10ms
**Config:** `~/.config/starship.toml`

**To Change Prompt:**

```zsh
# In ~/.zsh/zshrc, comment out:
# eval "$(starship init zsh)"

# Add alternative (e.g., Powerlevel10k, Pure, etc.)
```

---

## Common Tasks

### Add a Plugin (Antidote)

Edit `~/.zsh_plugins.txt` (symlink to `~/.zsh/plugins.txt`):

```txt
# Add new plugin
user/repo
ohmyzsh/ohmyzsh path:plugins/plugin-name
```

Open new shell - auto-regenerates plugin bundle

### Add a Plugin (Zinit)

Edit `~/.zsh/frameworks/zinit.zsh`:

```zsh
zinit light user/repo
```

### Add a Plugin (OMZ)

Edit `~/.zsh/frameworks/omz.zsh`:

```zsh
plugins=(
  git
  your-new-plugin
)
```

### Reload Configuration

```zsh
exec zsh  # Clean reload (recommended)
# or
source ~/.zshrc  # May show harmless warnings
```

### Measure Startup Time

```zsh
time zsh -i -c exit
```

### Add Aliases/Functions

Edit files in `~/.zsh/`:

- `aliases.zsh` - Command shortcuts
- `utils.zsh` - Custom functions
- `scripts.zsh` - Complex functions

---

## Performance Tips

1. **Use Antidote/Zinit** for speed (not OMZ)
2. **Remove unused plugins** from your plugin list
3. **Enable compinit caching** (already configured)
4. **Avoid loading entire OMZ lib** - load only specific files needed
5. **Measure before/after** when adding plugins

---

## Troubleshooting

**Problem:** Plugins not loading
**Solution:** Regenerate with `antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh`

**Problem:** Slow startup
**Solution:** Run `time zsh -i -c exit` and remove heavy plugins

**Problem:** Tab completion not highlighting
**Solution:** Check `completion.zsh` is loaded

**Problem:** `_style=''` output when sourcing
**Solution:** Use `exec zsh` instead of `source ~/.zshrc`

---

## Expected Performance

| Framework | Load Time | Setup Complexity | Flexibility |
| --------- | --------- | ---------------- | ----------- |
| Zinit     | 50-70ms   | High ⭐⭐⭐      | Very High   |
| Antidote  | 80-100ms  | Low ⭐           | Medium      |
| OMZ       | 300-500ms | Very Low         | Low         |

**Current Setup:** ~82ms with Antidote
