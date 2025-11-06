# Benchmark zsh startup time
zbench() {
  local runs=${1:-5}
  local total=0
  local results=()

  echo "Measuring zsh startup time ($runs runs)...\n"

  for i in {1..$runs}; do
    local time_output=$(command time -p zsh -i -c exit 2>&1)
    local real_time=$(echo "$time_output" | grep '^real' | awk '{print $2}')
    local ms=$(echo "$real_time * 1000" | bc)
    results+=($ms)
    total=$(echo "$total + $ms" | bc)
    printf "Run %d: %.0fms\n" $i $ms
  done

  local avg=$(echo "scale=0; $total / $runs" | bc)

  echo "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  printf "Average: %.0fms\n" $avg
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
# 📊 Pro Zsh Startup Benchmark Suite
zbench_pro() {
  emulate -L zsh
  local runs=${1:-5}
  local tmpfile=$(mktemp)
  local times=()

  echo "\n🚀 Benchmarking interactive Zsh startup ($runs runs)..."
  echo "Measuring *time to first prompt*, not exit time.\n"

  for ((i = 1; i <= runs; i++)); do
    # Time until PS1 is first drawn
    local real=$(
      /usr/bin/time -p zsh -i -c '
        zmodload zsh/datetime
        printf "%s\n" "$EPOCHREALTIME" > /tmp/zsh-start
        echo "" > /dev/null
      ' 2>&1 | awk '/real/ {print $2}'
    )

    # Convert to ms
    local ms=$(printf "%.0f" "$(echo "$real * 1000" | bc -l)")
    times+=($ms)
    printf "Run %d: %3d ms\n" $i $ms
  done

  # Stats
  local total=0
  for t in $times; do total=$((total + t)); done
  local avg=$((total / runs))
  local sorted=("${(@o)times}")
  local median=${sorted[$(( (runs + 1) / 2 ))]}
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
