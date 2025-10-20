
mvd() {
  mv "$HOME/Downloads/$1" "${@:2}"
}
compdef '_files -W ~/Downloads' mvd

pg() {
  case "$1" in
    start)
      brew services start postgresql@14
      ;;
    stop)
      brew services stop postgresql@14
      ;;
    status)
      if brew services list | grep -q "postgresql@14.*started"; then
        echo "✅ running"
      else
        echo "❌ not running"
      fi
      ;;
    *)
      echo "Usage: pg {start|stop|status}"
      ;;
  esac
}
kbo() {
  open ~/cs/kb.pdf
}
