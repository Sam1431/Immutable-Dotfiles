# ~/.config/nixpkgs/user/app.nix
{ config, pkgs, lib, ... }:
{
home.packages = with pkgs; [

##### SYSTEM ##### ------------------
ranger
unzip
trash-cli
htop
ffmpeg
wpa_supplicant_gui

##### UTILITIES ##### ---------------
scrot
unclutter
ueberzug
neofetch
cava
slop
betterlockscreen

##### NETWORK ##### -----------------
firefox
connman-gtk
qutebrowser

##### MEDIA ##### -------------------
pavucontrol
mpd
mpc_cli
mpd-mpris
playerctl
pulsemixer
feh
gcolor2
rofi
mpv

##### LIB ##### ---------------------
libnotify
libsForQt5.qtstyleplugins

##### THEMING ##### -----------------
lxappearance
numix-cursor-theme
dracula-theme

##### EDITING ##### -----------------
gnvim
easytag

##### COMIC ##### -------------------
zathura
qcomicbook
hakuneko

##### RUST ##### --------------------
broot
exa
tokei
procs
ripgrep
fd

##### APPLIST END ##### -------------

    ];
}
