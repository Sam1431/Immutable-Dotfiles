{ config, pkgs, hostName, lib, ...}:
let
  helium = ./helium/options.nix;    # HORIZON
  neon = ./neon/options.nix;        # GRUVBOX
  argon = ./argon/options.nix;      # PALENIGHT
  krypton = ./krypton/options.nix;  # NORD
  xenon = ./xenon/options.nix;      # ONEDARK
  radon = ./radon/options.nix;
in

{
  imports = [ krypton ];
}
