{ config, pkgs, hostName, lib, ...}:
{
  imports = [
     ../../../station/utilities/zsh.nix
     ../../../station/utilities/nushell.nix
     ../../../station/utilities/starship.nix
  ];

}
