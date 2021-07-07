{ config, pkgs, hostName, lib, ...}:

{
  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = pkgs.writeText "xmonad.hs" ''
        ${builtins.readFile ../../../themes/horizon/horizon.hs}
      '';
    };
  };
}
