#!/bin/bash

echo "Select a profile:"
echo "   (1) Coding"
echo "   (2) Screencasting"
read -r profile

if [ "$profile" -eq 1 ]; then
	rm /kitty/kitty.conf
	cp /kitty/kitty-coding.conf ~/dotfiles/.config/kitty/kitty.conf
	echo "Get in the flow!"
elif [ "$profile" -eq 2 ]; then
	rm /kitty/kitty.conf
	cp /kitty/kitty-screencasting.conf ~/dotfiles/.config/kitty/kitty.conf
	echo "Have fun recording!"
else
	echo "What the hell?"
fi
