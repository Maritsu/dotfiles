#!/bin/sh
# REQUIRES ARCHLINUX

[[ "$1" == "-a" ]] && AURF=1 || AURF=0

aur=0
if [[ $AURF -eq 1 ]]; then
  aav=$(type checkupdates+aur)
  aave=$?
  if [[ $aave -eq 0 ]]; then
    aur=1
  else
    echo -e "\e[1;31m==> ERROR: \e[1;32mcheckupdates+aur \e[1;37mnot found. Dropping back to \e[1;32mcheckupdates\e[1;37m...\e[m"
  fi
fi

if [[ $aur -eq 0 ]]; then
  [[ pr_checkupdates -eq 1 ]] && exit 126
  bar=$(type checkupdates)
  bares=$?
  if [[ $bares -ne 0 ]]; then
    echo -e "\e[1;31m==> ERROR: \e[1;32mcheckupdates \e[1;37mnot found. Are you using \[1;36mArch Linux\e[1;37m?\e[m"
    exit 126
  fi
fi

echo -e "\e[1;34m:: \e[1;37mChecking for updates... \e[m"

ul=""
[[ $aur -eq 1 ]] && ul=$(checkupdates+aur) || ul=$(checkupdates)
exist=$?

if [[ $exist -ne 0 ]]; then
  case $exist in
    1) echo -e "\e[0;31mAn unknown error has occured.\e[m"; exit 1;;
    2) echo -e "There is nothing to do"; exit 2;;
  esac
fi

declare -A sensitivepkgs=([linux]=1 [grub]=1 [systemd]=1 [mkinitcpio]=1)
availablesensitivepkgs=()
linesprinted=0 # bogus binted
while IFS= read -r line; do
  packagename=$(echo "$line" | cut -d" " -f1)
  
  sensitivea=""
  sensitiveb=""
  if [[ -n "${sensitivepkgs[$packagename]}" ]]; then
    sensitivea="\e[0;34m"
    sensitiveb="\e[m"
    availablesensitivepkgs+="$packagename"
  fi

  oldver=$(echo "$line" | cut -d" " -f2)
  newver=$(echo "$line" | cut -d" " -f4)
  echo -e "$sensitivea$packagename$sensitiveb \e[1;31m$oldver\e[m \e[0;30m->\e[m \e[1;32m$newver\e[m"
  ((linesprinted++))
done <<< "$ul"
echo -e "\e[0;36mTotal updates: \e[1;36m$linesprinted\e[m"
aspn=${#availablesensitivepkgs[@]}
[[ $aspn -gt 0 ]] && echo -e "\e[0;34mSensitive packages: \e[1;34m$aspn\e[m"

printf "\n\e[1;34m:: \e[1;37mDo you want to proceed? [Y/n] \e[m"
read choice
[[ "$choice" == "" ]] && choice="Y"
case $choice in
  [yY]*) break;;
  *) exit;;
esac

# Use sudo by default for compatibility
[[ $aur -eq 1 ]] && yay -Syyu --noconfirm || sudo pacman -Syyu --noconfirm
