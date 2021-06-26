{ config, pkgs, lib, ... }:

{
  programs.zsh = { 
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    # shellAliases = import ./alias.nix;
    autocd =true;
    dotDir = ".config/zsh";
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" "sudo" "vi-mode" "zsh-interactive-cd" "history" "git-prompt" "themes" ];
    #   theme = "afowler";
    # };
  };
}
