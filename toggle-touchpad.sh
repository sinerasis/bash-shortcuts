#!/bin/bash

# I cherry picked from this: https://askubuntu.com/questions/844151/enable-disable-touchpad
# Remember to make this file executable! (chmod +x toggle-touchpad.sh)

let device=`xinput list | grep -i touchpad | sed 's/.*id=\([0-9]*\).*/\1/g'`
let state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
  xinput --disable $device
else
  xinput --enable $device
fi
