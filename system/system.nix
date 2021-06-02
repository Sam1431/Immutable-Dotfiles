{ config, pkgs, hostName, lib, ...}:
{
  imports = [
    ./apps/app.nix
    ./profiles/profile.nix
#    ./config/conf-utils/zsh.nix
  ];

}

