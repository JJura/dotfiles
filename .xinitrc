if [ -f $HOME/.Xresources ]; then
    xrdb $HOME/.Xresources
fi

if [ -f $HOME/.config/compton/compton.conf ]; then
    compton -b --config $HOME/.config/compton/compton.conf
fi

if [ -f $HOME/.Xwallpaper ]; then
    feh --no-fehbg --bg-scale $HOME/.Xwallpaper
fi

statusbar &
exec dwm
