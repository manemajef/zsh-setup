
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
