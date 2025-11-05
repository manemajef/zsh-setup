# ⚡ Ridiculously Fast Zsh Config

**20ms startup time.** Yes, really.

## Proof

```bash
$ time zsh -i -c exit
zsh -i -c exit  0.01s user 0.01s system 85% cpu 0.020 total

# Run your own benchmark
for i in {1..10}; do /usr/bin/time zsh -i -c exit 2>&1; done
```

**What you get:**
- Syntax highlighting
- Autosuggestions
- 260+ completions (docker, kubectl, npm, git, etc.)
- History substring search
- Vi mode
- Starship prompt
- All your favorite plugins

**How:** Aggressive deferring + static plugin loading + optimized compinit caching

---

## Installation

```bash
git clone https://github.com/manemajef/zsh-setup.git ~/.zsh
brew install antidote
echo "source ~/.zsh/zshrc" >> ~/.zshrc
exec zsh
```

---

## Structure

```
~/.zsh/
├── zshrc                # Main config
├── antidote/
│   ├── plugins.txt      # Plugin list (edit this)
│   └── plugins.zsh      # Generated bundle
├── plugins/             # Custom configs
└── aliases.zsh          # Your aliases
```

---

## Usage

**Add a plugin:**
```bash
echo "user/repo" >> ~/.zsh/antidote/plugins.txt
exec zsh
```

**Add aliases:**
```bash
echo "alias gs='git status'" >> ~/.zsh/aliases.zsh
```

**Benchmark:**
```bash
zbench      # Average of 10 runs
```

---

## Plugins Included

- `zsh-defer` - Deferred loading engine
- `zsh-completions` - 260+ extra completions
- `zsh-syntax-highlighting` - Syntax colors
- `zsh-autosuggestions` - Command suggestions
- `zsh-history-substring-search` - Better history
- `zsh-vi-mode` - Vi keybindings
- `zsh-you-should-use` - Reminds you of aliases
- `z` - Smart directory jumping

All deferred except core completions = instant prompt

---

## Performance Tips

Current optimizations:
- ✅ Static plugin bundles (no dynamic loading)
- ✅ Deferred plugin loading (via `kind:defer`)
- ✅ Completion cache (24hr rebuild cycle)
- ✅ Minimal OMZ (only git lib/plugin)

**Benchmark yourself:**
```bash
/usr/bin/time zsh -i -c exit
```
