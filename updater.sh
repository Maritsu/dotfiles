#!/bin/sh
# REQUIRES ARCHLINUX

aur=-1
foo=$(type checkupdates+aur)
fooes=$?
if [[ $fooes -ne 0 ]]; then
  case $fooes in
    1) aur=0;;
    *) ;;
  esac
  bar=$(type checkupdates)
  bares=$?
  if [[ $bares -ne 0 ]]; then
    echo -e "\e[1;31mcheckupdates \e[0;31mnot found. Are you using \[1;36mArch Linux?\e[m"
    exit 126
  fi
else
  aur=1
fi

echo -e "\e[1;34m:: \e[1;37mChecking for updates... \e[m"

ul=""
[[ $aur -eq 1 ]] && ul=$(checkupdates+aur $@) || ul=$(checkupdates $@)
exist=$?

if [[ $exist -ne 0 ]]; then
  case $exist in
    1) echo -e "\e[0;31mAn unknown error has occured.\e[m"; exit 1;;
    2) echo -e "There is nothing to do"; exit 2;;
  esac
fi

while IFS= read -r line; do
  packagename=$(echo "$line" | cut -d" " -f1)
  oldver=$(echo "$line" | cut -d" " -f2)
  newver=$(echo "$line" | cut -d" " -f4)
  echo -e "$packagename \e[1;31m$oldver\e[m \e[0;30m->\e[m \e[1;32m$newver\e[m"
done <<< "$ul"

printf "\n\e[1;34m:: \e[1;37mDo you want to proceed? \e[0;33m[Y/n] \e[m"
read choice
[[ "$choice" == "" ]] && choice="Y"
case $choice in
  [yY]*) break;;
  *) echo -e "\e[0;31mExiting...\e[m"; exit;;
esac

# Use sudo by default for compatibility
[[ $aur -eq 1 ]] && yay -Syyu --noconfirm || sudo pacman -Syyu --noconfirm
