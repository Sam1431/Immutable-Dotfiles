# ~/.config/nixpkgs/user/app.nix
{ config, pkgs, lib, ... }:

let
    search_script = pkgs.writeShellScriptBin "search"
    (import ./scripts/nix-search.nix { inherit pkgs; });
    
    fetch_script = pkgs.writeShellScriptBin "nfetch"
    (import ./scripts/nfetch.nix {});

    man_script = pkgs.writeShellScriptBin "macho"
    (import ./scripts/manix.nix { inherit pkgs; });

    polybar_script = pkgs.writeShellScriptBin "poly-launch"
    (import ./scripts/restart-polybar.nix { inherit pkgs; });
  
  # search_script = pkgs.writeShellScriptBin "ytfzf"
   # (import ./scripts/nix-search.nix { inherit pkgs; });
in
{
  imports = [
     ./repos/git/git.nix
     ./repos/nur/nur-progs.nix
     ./repos/neovim/neovim.nix
     ./repos/ncmpcpp/ncmpcpp.nix
     ./repos/polybar/polybar.nix
     ./repos/alacritty/alacritty.nix
     ./repos/compton/compton.nix
  ];

  home.packages = with pkgs; [

##### SYSTEM ##### ------------------
ranger
unzip
trash-cli
elvish
htop
ffmpeg
wpa_supplicant_gui
manix
search_script
man_script
fetch_script
polybar_script

##### UTILITIES ##### ---------------
scrot
unclutter
ueberzug
cmatrix
cava
exa
slop
betterlockscreen
fzf

##### NETWORK ##### -----------------
qutebrowser
firefox
youtube-dl
cmst

##### MEDIA ##### -------------------
vlc
pavucontrol
mpd
mpc_cli
mpd-mpris
playerctl
skippy-xd
pulsemixer
ncmpcpp
feh
easytag
imagemagick
gcolor2
rofi

##### LIB ##### ---------------------
libnotify
libsForQt5.qtstyleplugins

##### THEMING ##### -----------------
lxappearance
pop-gtk-theme
numix-cursor-theme
dracula-theme

##### APPLIST END ##### -------------

    ];
}
