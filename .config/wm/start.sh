#!/bin/sh
setxkbmap latam
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsetroot -cursor_name left_ptr
feh --bg-scale ~/Imágenes/Wallpapers/piano7.jpg
picom &
~/.config/lemonbar/bar.sh | lemonbar -f "SFMono Nerd Font:normal:size=10" -g 610x40+960+15 -n "lemon" &
