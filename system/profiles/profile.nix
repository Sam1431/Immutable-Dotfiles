{ config, pkgs, hostName, lib, ...}:
let
  xmonad = ./x11-xorg/xmonad/xmonad.nix;
  sway = ./wayland/sway/sway.nix;
  tty = ./tty/tty.nix;
in

{
  imports = [ xmonad ];
}
