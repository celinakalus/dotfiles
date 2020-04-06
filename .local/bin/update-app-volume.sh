#!/bin/bash
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
msgId="991050"

FOCUSED_WINDOW_ID=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | cut -d# -f2); 
FOCUSED_PID=$(xprop -id ${FOCUSED_WINDOW_ID} | grep '_NET_WM_PID' | cut -d= -f2); 
FOCUSED_INFO=$(pactl list sink-inputs | grep 'Sink Input\|Volume\|Mute\|application\.name\|application\.process\.id' | cut -d'#' -f2 | cut -d':' -f2-3 | cut -d'/' -f2 | cut -d'=' -f2 | sed 's/"//g' | paste -d' ' - - - - - | grep "${FOCUSED_PID}" | sed 's/ /\n/g' | sed '/^$/d')


SINK_INPUT_INDEX=$(echo "${FOCUSED_INFO}" | sed '1q;d')
MUTED=$(echo "${FOCUSED_INFO}" | sed '2q;d')
VOLUME=$(echo "${FOCUSED_INFO}" | sed '3q;d' | sed 's/%//g')
APP_NAME=$(echo "${FOCUSED_INFO}" | sed '4q;d')

if [[ "${APP_NAME}" == "" ]]; then
  dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "This app has no audio"
  exit
elif [[ "$@" == "toggle" ]]; then
  pactl set-sink-input-mute ${SINK_INPUT_INDEX} toggle 
else
  notify-send "$@"
  pactl set-sink-input-volume ${SINK_INPUT_INDEX} "$@"
fi

if [[ ${VOLUME} == 0 || "${MUTED}" == "yes" ]]; then
   # Show the sound muted notification
   dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted" 
else
   # Show the volume notification
   dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
   "Volume: ${VOLUME}%" "$(getProgressString 20 "█" "░" ${VOLUME})"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
