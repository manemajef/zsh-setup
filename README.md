# Zsh Configuration

Modular Zsh setup supporting multiple plugin managers with optimized performance.

## Installation

```bash
# Clone this repo
git clone https://github.com/manemajef/zsh-setup.git ~/.zsh

# Copy example secrets file and edit it
cp ~/.zsh/secret.zsh.example ~/.zsh/secret.zsh
# Edit ~/.zsh/secret.zsh with your API keys

# Install Antidote (recommended)
brew install antidote

# Add this line to your ~/.zshrc
echo "source ~/.zsh/zshrc" >> ~/.zshrc

# Reload shell
exec zsh
```

**Note:** The main entry point is `~/.zsh/zshrc` which must be sourced from your `~/.zshrc` file.

## Setup Overview

```
~/.zsh/
├── zshrc              # Main config (sourced from ~/.zshrc)
├── antidote/          # Antidote plugin manager (ACTIVE)
│   ├── antidote.zsh   # Framework loader
│   ├── plugins.txt    # Plugin list
│   └── plugins.zsh    # Auto-generated bundle
├── frameworks/        # Alternative plugin managers (NOT loaded)
│   ├── zinit.zsh      # Fastest, complex
│   └── omz.zsh        # Easiest, slowest
├── plugins/           # Plugin-specific configurations
│   ├── completion.zsh # Tab completion styling & behavior
│   ├── crun.zsh       # C file compile-and-run function
│   ├── pg.zsh         # PostgreSQL service manager
│   └── yazy.zsh       # Yazi file manager integration
├── aliases.zsh        # Command aliases
├── secret.zsh         # Environment variables (gitignored)
└── archive/           # Backup/unused configs
```

**Note:** The `frameworks/` folder contains alternative plugin manager configurations that are currently **not loaded**. Only `antidote/` is active.

### Configuration Structure

Your main `~/.zshrc` file should simply source the modular config:

```zsh
# In ~/.zshrc (your home directory)
source ~/.zsh/zshrc
```

The actual configuration lives in `~/.zsh/zshrc`, which handles:

1. **PATH setup** - Add your custom paths (npm, brew, python, etc.)
2. **Plugin framework** - Loads `~/.zsh/antidote/antidote.zsh` (active)
3. **Completion system** - Configures zsh completion with caching
4. **Custom configs** - Auto-loads:
   - `~/.zsh/aliases.zsh` - Command shortcuts
   - `~/.zsh/secret.zsh` - Environment variables (gitignored)
   - `~/.zsh/plugins/*.zsh` - Plugin-specific configurations

**Plugin configurations** (in `~/.zsh/plugins/`):

- Add any plugin-specific settings or custom functions here
- Files are auto-loaded by `~/.zsh/zshrc`
- Examples: completion styling, custom functions, tool integrations

---

## Plugin Manager

### Antidote (Current - ⚡ Fast & Simple)

**Load Time:** ~110-115ms
**Complexity:** Low
**Best For:** Speed without configuration overhead

**Setup:**

1. Install: `brew install antidote`
2. Edit `~/.zsh/antidote/plugins.txt` to add/remove plugins
3. Reload shell - auto-regenerates `plugins.zsh` on changes

**Config Files:**

- `~/.zsh/antidote/antidote.zsh` - Framework loader (currently active)
- `~/.zsh/antidote/plugins.txt` - Plugin list (tracked in git)
- `~/.zsh/antidote/plugins.zsh` - Auto-generated static bundle

**Alternative Managers** (in `~/.zsh/frameworks/` - not currently loaded):

- `zinit.zsh` - Fastest (50-70ms) but complex setup
- `omz.zsh` - Easiest (300-500ms) but slowest

To switch frameworks, edit `~/.zsh/zshrc` to source a different manager.

---

## Common Tasks

### Add a Plugin

Edit `~/.zsh/antidote/plugins.txt`:

```txt
# Add new plugin
user/repo
ohmyzsh/ohmyzsh path:plugins/plugin-name
```

Reload shell - auto-regenerates plugin bundle

### Add Plugin Configuration

Create or edit files in `~/.zsh/plugins/`:

```zsh
# Example: ~/.zsh/plugins/myconfig.zsh
# Plugin-specific settings or custom functions
export MY_PLUGIN_VAR="value"
```

Files in `plugins/` are auto-loaded by `~/.zsh/zshrc`

### Add Aliases/Functions

Edit `~/.zsh/aliases.zsh`:

```zsh
alias ll='ls -lah'
alias gs='git status'
```

### Modify Core Config

Edit `~/.zsh/zshrc` for:

- PATH modifications
- Switching plugin managers
- Core zsh settings

### Reload Configuration

```zsh
exec zsh  # Clean reload (recommended)
```

### Measure Startup Time

```zsh
# Using the benchmark utility (recommended - averages multiple runs)
zbench          # Default: 5 runs
zbench 10       # Custom: 10 runs

# Or manually with time command
time zsh -i -c exit
```

---

## Plugin Configurations

Files in `~/.zsh/plugins/` provide plugin-specific settings:

- **`benchmark.zsh`** - Measure shell startup time with `zbench [runs]` (default: 5 runs)
- **`completion.zsh`** - Tab completion styling, menu selection, fuzzy matching, case-insensitive completion
- **`crun.zsh`** - Compile and run C files with `crun file.c` (outputs to `./out/`)
- **`pg.zsh`** - PostgreSQL service control with `pg start|stop|status`
- **`yazy.zsh`** - Yazi file manager integration (changes directory on exit)

Add your own `.zsh` files here for custom tool integrations or plugin settings.

---

## Troubleshooting

**Problem:** Plugins not loading
**Solution:** Regenerate with `antidote bundle < ~/.zsh/antidote/plugins.txt > ~/.zsh/antidote/plugins.zsh`

**Problem:** Slow startup
**Solution:** Run `time zsh -i -c exit` and remove heavy plugins from `plugins.txt`

**Problem:** Config not loading
**Solution:** Ensure `source ~/.zsh/zshrc` is in your `~/.zshrc`

---

## Performance

**Current Setup:** ~115ms with Antidote (measured with `time zsh -i -c exit`)
