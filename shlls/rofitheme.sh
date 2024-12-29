#!/bin/zsh

fx_remove() {
	#Remove old config
	sed -E '165,192d' $HOME/.config/rofi/config.rasi 
}

fx_set() {
	local color=$1
	sed -E '166a${color}' $HOME/.config/rofi/config.rasi 
}


