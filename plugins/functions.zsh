copykatex() {
  printf '%s' 'document.querySelectorAll(".katex-html").forEach(n => n.style.direction = "ltr")' | pbcopy
  echo "✓ Copied KaTeX fix snippet to clipboard"
}

ktx() {
  cat <<'EOF' | pbcopy
const style = document.createElement("style");
style.textContent = `
.katex {
  direction: ltr;
  unicode-bidi: isolate;
}
`;
document.head.appendChild(style);
EOF
echo "coppied"
}
