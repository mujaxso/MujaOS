#!/usr/bin/env bash

choice=$(printf " Lock\n Suspend\n Reboot\n Power Off\n Logout" | rofi -dmenu -p "Power Menu")

case "$choice" in
  " Lock")     hyprlock ;;                          # or swaylock, betterlockscreen, etc.
  " Suspend")  systemctl suspend ;;
  " Reboot")   systemctl reboot ;;
  " Power Off") systemctl poweroff ;;
  " Logout")   hyprctl dispatch exit ;;             # Hyprland logout
esac
