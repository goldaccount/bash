#!/bin/zsh
dfu-programmer atmega32u4 erase
dfu-programmer atmega32u4 flash $1.hex
dfu-programmer atmega32u4 reset 

