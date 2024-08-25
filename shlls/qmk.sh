#!/bin/zsh
avrdude -p atmega32u4 -c avr109 -u flash:w:$1:i -P /dev/ttyACM0 
