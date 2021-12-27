. ~/.profile
xrandr --output HDMI-3 --mode 1920x1080 --right-of HDMI-2 --auto
xrdb ~/.Xresources
slstatus >/dev/null 2>&1 &
exec dwm
