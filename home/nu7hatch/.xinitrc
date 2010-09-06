#!/bin/sh

if [ $WALLPAPER ] ; then
    exec feh --bg-center $WALLPAPER &
fi

exec gkrellm &
exec fluxbox