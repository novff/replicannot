#!/bin/bash
# Enables middle click to scroll (like Windows).
pointerids=($(xinput list | grep "pointer" | perl -p -e 's@.*?id=(\d+).*@\1@'))

for ((i = 0; i < ${#pointerids[@]}; i++))
do
  echo "Setting up for device id = ${pointerids[$i]}"
  # If the pointer supports scroll method, set middle click to scroll
  if xinput list-props ${pointerids[$i]} | grep 'Scroll Method Enabled' &>/dev/null; then
    xinput set-prop ${pointerids[$i]} 'libinput Scroll Method Enabled' 0 0 1
  fi
done
