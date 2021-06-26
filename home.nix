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
    SHELL = "zsh";
  };
}

