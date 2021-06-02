{ config, pkgs, hostName, lib, ...}:

{
  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = pkgs.writeText "xmonad.hs" ''
        ${builtins.readFile ./xmonad.hs}
      '';
    };
  };

  imports = [
#    ../../../station/utilities/zsh.nix
     ../../../station/utilities/nushell.nix
#    ../../../station/utilities/starship.nix
  ];

}
