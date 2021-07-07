{ config, pkgs, hostName, lib, ...}:

{
imports = [
  ./roles/role.nix
  ./user/non-free/non.nix
  ];

  programs.home-manager.enable = true;
  programs.home-manager.path = "$HOME/.config/nixpkgs/home-manager";
}

