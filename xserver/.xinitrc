#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

/usr/local/bin/dwm_status.sh &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ "$(tty)" = "/dev/tty6" ]; then
	startx &
	exec urxvt -e tmux
fi

if [ "$(tty)" = "/dev/tty1" ]; then
	startx &
	xrandr --output VGA-1 --mode 1920x1080 &
	~/.fehbg $
    #/usr/local/bin/dwm_status.sh &
	#exec dwm 
    exec i3wm
fi
