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
gotop
wpa_supplicant_gui
autotiling
element-desktop

##### SWAY ##### --------------------
swaybg
wf-recorder
swaylock
waybar
wofi
xdg-desktop-portal-wlr

##### UTILITIES ##### ---------------
pfetch

##### NETWORK ##### -----------------
firefox
connman-notify
connman-ncurses
qutebrowser

##### MEDIA ##### -------------------
mpd
mpc_cli
pulsemixer

##### LIB ##### ---------------------
libnotify
libsForQt5.qtstyleplugins

##### THEMING ##### -----------------
nordic

##### EDITING ##### -----------------
easytag

##### COMIC ##### -------------------
hakuneko

##### RUST ##### --------------------
broot
exa
tokei
procs
ripgrep
fd
tealdeer

##### DEVELOP ##### -----------------
gcc
python3
fzf

##### APPLIST END ##### -------------

    ];
}
