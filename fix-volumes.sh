#!/bin/bash

set -e

R='\033[0;31m'
Y='\033[1;33m'
G='\033[0;32m'
N='\033[0m'

first_mount="/mnt/.first-mount.sh"

while [ ! -b /dev/sda ]; do
   echo -e "${Y}Please attach one or more volumes to this droplet using Cloud UI${N}: https://cloud.digitalocean.com/volumes"
   echo -e -n "${Y}Press any key once done:${N} "
   read -n 1
   echo
done

for d in /dev/sd*; do
   echo -e -n "${Y}Inspecting disk ${d}${N}: "
   fs=$(blkid -s TYPE -o value "${d}")

   mount -t "${fs}" "${d}" /mnt
   if [ -f "${first_mount}" ]; then
      echo -e "${R}disk was not properly initialized, fixing${N}"
      rm -f "${first_mount}"
   else
      echo -e "${G}disk is clean${N}"
   fi

   umount /mnt
done

echo -e "${Y}All disks are fixed. Please detach them from the Cloud UI${N}"
