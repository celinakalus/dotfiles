#!/bin/bash
# update_brightness.sh

getProgressString () {
  ITEMS="$1" # The total number of items(the width of the bar)
  FILLED_ITEM="$2" # The look of a filled item 
  NOT_FILLED_ITEM="$3" # The look of a not filled item
  STATUS="$4" # The current progress status in percent

  # calculate how many items need to be filled and not filled
  FILLED_ITEMS=$(echo "((${ITEMS} * ${STATUS})/100 + 0.5) / 1" | bc)
  NOT_FILLED_ITEMS=$(echo "$ITEMS - $FILLED_ITEMS" | bc)

  # Assemble the bar string
  msg=$(printf "%${FILLED_ITEMS}s" | sed "s| |${FILLED_ITEM}|g")
  msg=${msg}$(printf "%${NOT_FILLED_ITEMS}s" | sed "s| |${NOT_FILLED_ITEM}|g")
  echo "$msg"
}

# Arbitrary but unique message id
msgId="991050"

# Get current brightness
cur_brightness="$(xbacklight -get | awk '{print int($1)}')"

xbacklight -set $(expr ${cur_brightness} + $1)

new_brightness="$(xbacklight -get | awk '{print int($1)}')"


dunstify -a "update-brightness" -u low -i sunny -r "$msgId" \
"Brightness: ${new_brightness}%" "$(getProgressString 20 "█" "░" ${new_brightness})"

# Play the volume changed sound
#canberra-gtk-play -i audio-volume-change -d "changeVolume"
