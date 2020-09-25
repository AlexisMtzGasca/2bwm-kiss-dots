#!/bin/sh
#  ██                       
# ░██                       
# ░██       ██████   ██████ 
# ░██████  ░░░░░░██ ░░██░░█ 
# ░██░░░██  ███████  ░██ ░  
# ░██  ░██ ██░░░░██  ░██    
# ░██████ ░░████████░███    
# ░░░░░    ░░░░░░░░ ░░░     
#

. "${HOME}/.cache/wal/colors.sh"

Clock() {
        TIME=$(date '+%I:%M %p')
        echo -n "%{F$color1}愈%{F-}" "%{F$color7}$TIME%{F-}"
}

Date() {
	DATE=$(date '+%b %d, %Y')
	echo -n "%{F$color1}类%{F-}" "%{F$color7}$DATE%{F-}"
}

Bright () {
	BRI=$(brillo)
	echo -n "%{F$color1}滛%{F-}" "%{F$color7}$BRI%{F-}"
}

Volume() {
	VOL=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]')
	echo -n "%{F$color1}奔%{F-}" "%{F$color7}$VOL%{F-}"
}
SEP2="    "
Workspaces() {
	ACTUAL=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $ACTUAL in
		0)
			echo -n "%{F$color7} I%{F$color3} II III IV V%{F$color7}"
		;;

		1)
			echo -n "%{F$color3} I %{F$color7}II%{F$color3} III IV V%{F$color3}"
		;;

		2)
			echo -n "%{F$color3} I II%{F$color7} III%{F$color3} IV V%{F$color7}"
		;;
		3)
			echo -n "%{F$color3} I II III%{F$color7} IV %{F$color3}V%{F$color7}"
		;;

		4)
			echo -n "%{F$color3} I II III IV %{F$color7}V%{F$color7}"
		;;
	esac
}
while true; do
	echo "%{c}%{B$background}%{F$color7}$SEP2$(Workspaces)$SEP2$(Volume)$SEP2$(Bright)$SEP2$(Date)$SEP2$(Clock)$SEP2%{F-}%{B-}"
	sleep 0.1s
done
