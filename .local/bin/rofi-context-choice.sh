rofi \
  -dmenu \
  -markup-rows \
  -no-fullscreen \
  -hide-scrollbar \
  -bw 2 \
  \ #-m -3 \
  -theme-str '#window {anchor:southeast; location:southeast; y-offset:-20;}' \
  -eh 1 \
  -width -22 \
  -lines 8 \
  -no-custom \
  -p "$1"
