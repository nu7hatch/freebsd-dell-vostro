#!/bin/sh

mkdir ~/kernels
fetch http://github.com/nu7hatch/freebsd-dell-vostro/raw/root/kernels/DELLVOSTRO -o ~/kernels/DELLVOSTRO
cd /usr/src/sys/amd64/conf
ln -s ~/kernels/DELLVOSTRO
config DELLVOSTRO 
cd /usr/src
make buildkernel KERNCONF=DELLVOSTRO &&
make installkernel KERNCONF=DELLVOSTRO  
