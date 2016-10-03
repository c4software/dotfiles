#!/bin/bash

xinput --set-prop $1 "Evdev Wheel Emulation" 1
xinput --set-prop $1 "Evdev Wheel Emulation Axes" 6 7 4 5
xinput --set-prop $1 "Evdev Wheel Emulation Button" 2 
