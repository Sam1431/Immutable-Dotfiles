{ pkgs, lib, config, ... }:

{
    nixpkgs.config = { 
      allowUnfree = true; 
    };

    home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "alacritty";
    SHELL = "zsh";
  };



}
