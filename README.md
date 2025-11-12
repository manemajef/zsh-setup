# Ridiculously Fast Zsh Config

_Antidote zsh config_

## Proof

**Using [`zsh-bench`](https://github.com/romkatv/zsh-bench)**

```zsh
❯ ~/.zsh/bench/zsh-bench
==> benchmarking login shell of user rotemsemah ...
creates_tty=0
has_compsys=0
has_syntax_highlighting=0
has_autosuggestions=0
has_git_prompt=0
first_prompt_lag_ms=53.217
first_command_lag_ms=53.570
command_lag_ms=7.408
input_lag_ms=10.171
exit_time_ms=42.178

```

> So Fast u can barley see the prompt loading

**What you get:**

> A minimal `oh-my-zsh` like shell with 10x less load time

- Aggresivly optimized setup
- Syntax highlighting
- Autosuggestions
- Intractive
- 260+ completions (docker, kubectl, npm, git, etc.)
- History substring search
- Vi mode
- Pure prompt
- costum place for aliases plugin configs and more

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
