#!/bin/bash

osascript -e 'tell application "Music"
  if player state is playing then
    set track_name to name of current track
    set artist_name to artist of current track
    return track_name & " by " & artist_name
  else
    return "Music not playing"
  end if
end tell'
