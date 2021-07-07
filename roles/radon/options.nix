{ pkgs, config, lib, ... }:
let
 gnu = import ./variables.nix;
  
  in
{

imports = [
            gnu.kitty
            gnu.nushell
            gnu.neovim
            gnu.ncmpcpp
            gnu.mako
            gnu.desktop
           # gnu.doom
            gnu.starship
            gnu.qutebrowser
            gnu.core
            gnu.xdg
            gnu.foot
     ];
   }
