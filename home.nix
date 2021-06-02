# https://nixos.wiki/wiki/Home_Manager

# This is a noobish modular home-manager config 
# inspired from Hugo Reeves' home-manager config 
# From here - https://github.com/HugoReeves/nix-home

{ config, pkgs, hostName, lib, ...}:

{
imports = [
    ./system/system.nix
  ];

  programs.home-manager.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "alacritty";
    SHELL = "nu";
  };
}

