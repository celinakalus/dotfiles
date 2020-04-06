dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted"#!/bin/bash
# changeVolume

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
msgId="991049"

# Change the volume using alsa(might differ if you use pulseaudio)
if [[ "$@" == "toggle" ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
else
  pactl set-sink-volume @DEFAULT_SINK@ "$@"
fi

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pactl list sinks | grep 'Volume' | head -n 1 | cut -d'%' -f1 | sed 's/ /\n/g' | tail -n 1)"
mute="$(pactl list sinks | grep 'Mute' | head -n 1 | cut -d':' -f2 | sed 's/ //g')"
if [[ $volume == 0 || "$mute" == "yes" ]]; then
   # Show the sound muted notification
   dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted" 
else
   # Show the volume notification
   dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
   "Volume: ${volume}%" "$(getProgressString 20 "█" "░" $volume)"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
