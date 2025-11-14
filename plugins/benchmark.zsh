# Strip ANSI and control escape sequences from benchmark output so that
# cursor-shape changes or title updates won't corrupt /usr/bin/time parsing.
_zbench_strip_control_sequences() {
  if (( $+commands[perl] )); then
    perl -0pe '
      s/\e\[[0-9;?]*[ -\/]*[@-~]//g;     # CSI sequences
      s/\e\][^\a]*(?:\a|\e\\)//g;        # OSC sequences
      s/\eP.*?\e\\//gs;                  # DCS sequences
      s/\e[\(\)][0-9A-Za-z]//g;          # Character set selections
      s/\r//g;                           # Carriage returns
    '
  else
    cat
  fi
}

# Benchmark zsh startup time
zbench() {
  local runs=${1:-5}
  local total=0
  local completed=0

  echo "Measuring zsh startup time ($runs runs)...\n"

  for ((i = 1; i <= runs; i++)); do
    local time_output
    local ms
    time_output=$(LC_ALL=C /usr/bin/time -p zsh -i -c exit 2>&1 | grep -v '^\$f{' | grep -v '^time_output')
    local clean_time_output=$(
      printf '%s\n' "$time_output" | _zbench_strip_control_sequences
    )

    ms=$(
      printf '%s\n' "$clean_time_output" | LC_ALL=C awk '
        /real[[:space:]]/ {
          sub(/.*real[[:space:]]+/, "", $0)
          printf "%d", ($0 * 1000) + 0.5
          exit
        }
      '
    )

    if [[ -z $ms ]]; then
      printf "Run %d: unable to parse timing output\n%s\n" $i "$time_output" >&2
      continue
    fi

    (( completed++ ))
    (( total += ms ))
    printf "Run %d: %dms\n" $i $ms
  done

  if (( completed == 0 )); then
    echo "No successful benchmark runs."
    return 1
  fi

  local avg=$(( total / completed ))

  echo "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  printf "Average: %dms\n" $avg
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # Performance rating
  if (( avg < 80 )); then
    echo "⚡ Excellent - Blazing fast!"
  elif (( avg < 150 )); then
    echo "✓ Good - Well optimized"
  elif (( avg < 300 )); then
    echo "○ Average - Could be optimized"
  else
    echo "⚠ Slow - Needs optimization"
  fi
}

# Strict variant that ensures nothing is printed before timing info.
# This is useful for catching stray escape sequences such as cursor-shape
# prints inside ~/.zshrc that would otherwise corrupt /usr/bin/time output.
zbench_strict() {
  local runs=${1:-5}
  local total=0
  local completed=0

  echo "Strictly measuring zsh startup ($runs runs)..."
  echo "If any output precedes the 'real' line from /usr/bin/time the run is skipped.\n"

  for ((i = 1; i <= runs; i++)); do
    local time_output
    local first_line
    local ms

    time_output=$(LC_ALL=C /usr/bin/time -p zsh -i -c exit 2>&1)

    local clean_time_output=$(
      printf '%s\n' "$time_output" | _zbench_strip_control_sequences
    )

    first_line=${clean_time_output%%$'\n'*}

    if [[ $first_line != real\ * ]]; then
      printf "Run %d: unexpected leading output detected:\n" $i >&2
      printf "         %q\n" "$first_line" >&2
      printf "        (likely caused by early prints such as cursor-shape escape codes)\n" >&2
      continue
    fi

    ms=$(
      printf '%s\n' "$first_line" | LC_ALL=C awk '
        /^real[[:space:]]+/ {
          sub(/^real[[:space:]]+/, "", $0)
          printf "%d", ($0 * 1000) + 0.5
          exit
        }
      '
    )

    if [[ -z $ms ]]; then
      printf "Run %d: unable to parse timing output\n%s\n" $i "$time_output" >&2
      continue
    fi

    (( completed++ ))
    (( total += ms ))
    printf "Run %d: %dms\n" $i $ms
  done

  if (( completed == 0 )); then
    echo "No successful benchmark runs."
    return 1
  fi

  local avg=$(( total / completed ))

  echo "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  printf "Average: %dms\n" $avg
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}
# 📊 Pro Zsh Startup Benchmark Suite
zbench_pro() {
  emulate -L zsh
  local runs=${1:-5}
  local tmpfile=$(mktemp)
  local times=()

  echo "\n🚀 Benchmarking interactive Zsh startup ($runs runs)..."
  echo "Measuring *time to first prompt*, not exit time.\n"

  for ((i = 1; i <= runs; i++)); do
    local time_output
    local ms

    # Time until PS1 is first drawn
    time_output=$(
      LC_ALL=C /usr/bin/time -p zsh -i -c '
        zmodload zsh/datetime
        printf "%s\n" "$EPOCHREALTIME" > /tmp/zsh-start
        echo "" > /dev/null
      ' 2>&1 | grep -v '^\$f{' | grep -v '^time_output'
    )

    local clean_time_output=$(
      printf '%s\n' "$time_output" | _zbench_strip_control_sequences
    )

    ms=$(
      printf '%s\n' "$clean_time_output" | LC_ALL=C awk '
        /real[[:space:]]/ {
          sub(/.*real[[:space:]]+/, "", $0)
          printf "%d", ($0 * 1000) + 0.5
          exit
        }
      '
    )

    if [[ -z $ms ]]; then
      printf "Run %d: unable to parse timing output\n%s\n" $i "$time_output" >&2
      continue
    fi

    times+=($ms)
    printf "Run %d: %3d ms\n" $i $ms
  done

  # Stats
  if (( ${#times[@]} == 0 )); then
    echo "No successful benchmark runs."
    rm -f $tmpfile
    return 1
  fi

  local total=0
  local run_count=${#times[@]}
  for t in $times; do total=$((total + t)); done
  local avg=$((total / run_count))
  local sorted=("${(@o)times}")
  local median=${sorted[$(( (run_count + 1) / 2 ))]}
  local fastest=${sorted[1]}
  local slowest=${sorted[-1]}

  echo "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "📈 Results:"
  printf "Avg:     %3d ms\n" $avg
  printf "Median:  %3d ms\n" $median
  printf "Fastest: %3d ms\n" $fastest
  printf "Slowest: %3d ms\n" $slowest
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  # Rating
  if (( avg < 80 )); then
    echo "⚡ Incredible — lightning fast!"
  elif (( avg < 150 )); then
    echo "✅ Very Good — well optimized"
  elif (( avg < 250 )); then
    echo "➖ Average — room for improvement"
  else
    echo "🐌 Slow — needs tuning"
  fi

  echo ""
  rm -f $tmpfile
}

# 🔍 Profile zsh startup to identify bottlenecks
pbench() {
  local tmpfile=$(mktemp)

  cat > "$tmpfile" << 'EOF'
# Enable profiling
zmodload zsh/zprof

# Source your actual config
source ~/.zshrc

# Output profile
zprof
EOF

  echo "🔍 Profiling zsh startup performance...\n"
  zsh "$tmpfile"
  rm -f "$tmpfile"
}
