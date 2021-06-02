{ config, pkgs, ... }:

{
 services.picom = {
   enable = true;
   # package = pkgs.callPackage ./picom-tryone.nix { };
   experimentalBackends = true;
   fade = true;
   fadeDelta = 2;
   shadow = true;
   shadowOffsets = [ (-8) (-8) ];
   shadowOpacity = "0.8";
   shadowExclude = [ "class_g = 'dzen*'" "class_g = 'dzen slave'" ];
   noDockShadow = false;
   noDNDShadow = false;
   # inactiveDim = "0.15";
   # activeOpacity = "1.0";
   # inactiveOpacity = "1.0";
   opacityRule = [ "100:name *?= 'xmobar'" "80:name *?= 'shellPrompt'" ];
   menuOpacity = "0.8";
   backend = "glx";
   vSync = true;
   extraOptions = ''
     shadow-radius = 8;
     clear-shadow = true;
     frame-opacity = 0.7;
    # blur-background = false;
    # blur-method = "dual_kawase";
    # blur-background-frame = true;
    # blur-strength = 6;
    # alpha-step = 0.06;
     detect-client-opacity = true;
     detect-rounded-corners = true;
    # paint-on-overlay = true;
    # detect-transient = true;
     mark-wmwin-focused = true;
     mark-ovredir-focused = true;
   '';
  };
}

