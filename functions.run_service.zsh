run_service() {
  while getopts ":v:o" opt; do
    case $opt in
      v)
        $redirect="2>/dev/null"
        ;;
      o)
        $start="onestart"
        ;;
      *)
        $start="start"
        ;;
    esac
  done

  if [ -x "/etc/rc.d/$1" ]; then
    /etc/rc.d/$1 $start $redirect;
  elif [ -x "/usr/local/etc/rc.d/$1" ]; then
    /usr/local/etc/rc.d/$1 $start $redirect;
  else
    echo "Service not found in '/etc/rc.d/' and '/usr/local/etc/rc.d/'"
    exit 1
  fi
  exit 0
}
