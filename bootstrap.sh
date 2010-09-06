#!/bin/sh

# Helper for working with ports. Finds package by name and starts
# silent compilation. Compilation flags are handled by second parameter.  
portinstall {
    if [ $# -gt 0 ] ; then 
        cd `whereis -sq $1` ; shift
        make -s install clean $@
    fi
}

# Starting DHCP...
dhclient re0

# Bluetooth test...
kldload ng_ubt

# Broadcom wifi...
# ....
# ...
# ..
# .

# Intel HDA sound card...
portinstall snd
kldxref /boot/kernel
kldload snd_hda

# Minimal xserver with keyboard & mouse support...
portinstall xorg-minimal
portinstall hal
portinstall dbus

# GeForce graphic card...
portinstall nvidia-driver WITHOUT_LINUX=yes WITH_ACPI_CM=yes
portinstall nvidia-settings
kldxref /boot/modules
kldload nvidia

# Touchpad drivers...
portinstall xf86-input-synaptics

# Digital camera...
# ....
# ...
# ..
# .

# My "eyecandy" Fluxbox :)
portinstall fluxbox
portinstall gkrellm   # stats
portinstall feh       # wallpaper
portinstall thunar    # file manager

# On amd64 version there is no bash so we have to install it manualy...
portinstall bash
ln -s /usr/local/bin/bash /bin/bash
echo "/bin/bash" >> /etc/shells

# Tools and applications...
portinstall nano
portinstall irssi
portinstall mplayer

# Configure everything...
fetch http://gihub.com/nu7hatch/freebsd-dell-vostro/raw/etc/X11/xorg.conf -o /etc/X11/xorg.conf
fetch http://gihub.com/nu7hatch/freebsd-dell-vostro/raw/etc/rc.conf -o /etc/rc.conf
fetch http://gihub.com/nu7hatch/freebsd-dell-vostro/raw/boot/loader.conf -o /boot/loader.conf


