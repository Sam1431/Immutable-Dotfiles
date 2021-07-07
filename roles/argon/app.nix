# ~/.config/nixpkgs/user/app.nix
{ config, pkgs, lib, ... }:


{
  
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  

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
xmobar

##### THEMING ##### -----------------
lxappearance
numix-cursor-theme
dracula-theme

##### EDITING ##### -----------------
gnvim
easytag
neovim

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
