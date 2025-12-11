copykatex() {
  printf '%s' 'document.querySelectorAll(".katex-html").forEach(n => n.style.direction = "ltr")' | pbcopy
  echo "✓ Copied KaTeX fix snippet to clipboard"
}

