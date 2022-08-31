# dotfiles
 Personal dotfiles repository, updated every now and then idk
---
### **THIS VERSION IS A WIP AND IS SUBJECT TO CHANGES.**
**This is the currently maintained dark mode version, the light version is available in the light branch, however it will not be updated.**

# Dependencies
- autorandr
- feh
- dunst
- dunstify
- pamixer
- scrot
- xrandr

**NOTE** that everything in this repository is styled to fit the [`deus`](https://github.com/ajmwagar/vim-deus) color scheme.

# What's inside?
- ## DWM
> *dwm is a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts. All of the layouts can be applied dynamically, optimising the environment for the application in use and the task performed.*
### DETAILS
**MODKEY (Mod):** Super/Windows key
Keybind|Action
---|---
<kbd>Mod-P</kbd>|Spawn dmenu
<kbd>Mod-Enter</kbd>|Spawn terminal
<kbd>Mod-J</kbd>|Focus next window/stack
<kbd>Mod-K</kbd>|Focus previous window/stack
<kbd>Mod-H</kbd>|Change master stack width (-0.05)
<kbd>Mod-L</kbd>|Change master stack width (+0.05)
<kbd>Mod-Z</kbd>|Move window to master stack
<kbd>Mod-Tab</kbd>|Change to previous tag
<kbd>Mod-Shift-C</kbd>|Close window
<kbd>Mod-Shift-Space</kbd>|Toggle floating behaviour
<kbd>Mod-,</kbd>|Focus left monitor
<kbd>Mod-.</kbd>|Focus right monitor
<kbd>Mod-Shift-,</kbd>|Move window to left monitor
<kbd>Mod-Shift-.</kbd>|Move window to right monitor
<kbd>Mod-<1-9></kbd>|Focus tag 1-9
<kbd>Mod-Shift-Q</kbd>|Restart DWM (does not quit to TTY)
<kbd>Mod-Ctrl-Q</kbd>|Kill DWM (actually quits, executes `pkill dwm`)
<kbd>Mod-Shift-L</kbd>|Lock screen
<kbd>Mod-Shift-P</kbd>|Take screenshot
<kbd>Vol+</kbd>|Increase volume by 5
<kbd>Vol-</kbd>|Increase volume by -5
<kbd>VolMute</kbd>|Toggle mute
### PATCHES
- coolautostart
- fullgaps
- preserveonrestart
- underlinetags
- zoomswap

---

## DMENU
> *dmenu is a dynamic menu for X, originally designed for dwm. It manages large numbers of user-defined menu items efficiently.*
### PATCHES
- caseinsensitive
- highlight

---

## SLSTATUS
> *slstatus is a status monitor for window managers that use WM_NAME or stdin to fill the status bar.*
### ENTRIES
- Volume (depends on pamixer)
- Wi-Fi strength
- CPU and RAM usage (in %)
- Battery state
- Date and time (DD/MM/YY HH:MM:SS)

---

## ST
> *st is a simple terminal implementation for X.*  
### DETAILS
**$TERM = "st"**
**Tab length:** 4
**Cursor shape:** Underline 
### PATCHES
- anysize
- dynamiccursorcolor
- font2
- scrollback
- scrollbackmouse

---

## SLOCK
> *slock is a simple X display locker.*
### PATCHES
- backgroundimage
- controlclear
- dpms

---

## DUNSTRC
> *Configuration file for dunst*  
**To be copied/symlinked by the user to ~/.config/dunst/dunstrc**

---

## XINITRC
> *Xinit configuration file*  
**To be copied/symlinked to ~/.xinitrc**
