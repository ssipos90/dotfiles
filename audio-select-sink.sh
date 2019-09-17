#!/bin/sh
# FEATURES
# - Doesn't show the sink that is already the default
# - Automatically switches all running input sinks when switching the default sink

# Get the current default sink
SINK_DEFAULT=$(pactl info | grep "Default Sink" | grep -P -o "(?!.+:) .*")

# Get the audio sink names
SINK_NAMES=$(pactl list sinks | grep "Name: " |  grep -P -o "(?!.+:) .*")

# Get the index of the default sink
DEFAULT_INDEX=$(printf "$SINK_NAMES" | grep -n "$SINK_DEFAULT" | sed 's/:.*//' )

# Get the audio sink descriptions
SINK_DESCRIPTIONS=$(pactl list sinks | grep "Description:" | cut --complement -c 1-13)

# Get all the programs that revieve the audio from the sinks
SINK_INPUTS=$(pactl list sink-inputs | grep "Sink Input #")

# Get the descriptions from the sinks without the default sink to display to the user and have the user pick a sink
SINK_DESCRIPTION=$(printf "$SINK_DESCRIPTIONS" | rofi -dmenu -selected-row $(expr $DEFAULT_INDEX - 1 ) -config $HOME/.dotfiles/rofi/config.rasi -lines 3 -width 20 -location 3 -i -fn "Fira Code Regular" -p "Switch audio sink")

if [[ $? -ne 0 ]]; then
  echo "Canceled"
  exit
fi

# Get the index for the answer that the user wrote
DESCRIPTION_INDEX=$(printf "$SINK_DESCRIPTIONS" | grep -n "$SINK_DESCRIPTION" | sed 's/:.*//')
DESCRIPTION_INDEX=$(($DESCRIPTION_INDEX - 1))

# Set the default sink
pactl set-default-sink $DESCRIPTION_INDEX

# Change all the ouputs for the programs that are using the default sink
printf "$SINK_INPUTS\n" | while read -r SINK_INPUT
do
	# Get the index for the program
	SINK_INPUT_INDEX=$(printf "$SINK_INPUT" | grep -P -o "(?!Sink Input#)[0-9]+")
	pactl move-sink-input $SINK_INPUT_INDEX $DESCRIPTION_INDEX
done

