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
wpa_supplicant_gui
autotiling
fish

##### SWAY ##### --------------------
swaybg
wf-recorder
swaylock
waybar
wofi
xdg-desktop-portal-wlr

##### UTILITIES ##### ---------------
ueberzug
neofetch
cava

##### NETWORK ##### -----------------
firefox
cmst
connman-notify
connman-ncurses
qutebrowser

##### MEDIA ##### -------------------
mpd
mpc_cli
playerctl
pulsemixer
mpv

##### LIB ##### ---------------------
libnotify
libsForQt5.qtstyleplugins

##### THEMING ##### -----------------
numix-cursor-theme
dracula-theme
nordic

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
hunter

##### DEVELOP ##### -----------------
brave
gcc
rustc
cargo
python

##### APPLIST END ##### -------------

    ];
}
