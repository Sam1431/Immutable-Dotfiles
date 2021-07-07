{ config, pkgs, hostName, lib, ...}:

{
  wayland.windowManager.sway = {
    enable = true;
      config = {
       down = "j";
       up = "k";
       left = "h";
       right = "l";
       modifier = "Mod4";

       startup = [{ command = "swaybg --mode fill --image ~/.config/nixpkgs/machine/wallpaper/abstract/mechanical-key.jpg"; }
                  { command = "mpd"; }
                  { command = "foot -s"; }
                  { command = "autotiling"; }
                 ];

       bars = [{ command = "waybar"; }];
       colors = {
         focused = {
           background = "#9da98d";
           border = "#9da98d";
           text = "#3a3a3a";
           indicator = "#778564";
           childBorder = "#81a1c1";
      };
         focusedInactive = {
           background = "#2e3440";
           border = "#2e3440";
           text = "#eceff4";
           indicator = "#2e3440";
           childBorder = "#2e3440";
      };
         placeholder = {
           background = "#000000";
           border = "#0c0c0c";
           text = "#eceff4";
           indicator = "#000000";
           childBorder = "#0c0c0c";
      };
         urgent = {
           background = "#cb7073";
           border = "#cb7073";
           text = "#eceff4";
           indicator = "#cb7073";
           childBorder = "#cb7073";
      };
         unfocused = {
           background = "#2e3440";
           border = "#2e3440";
           text = "#eceff4";
           indicator = "#2e3440";
           childBorder = "#2e3440";
      };

    };
           window.border = 2;
           focus.followMouse = true;
#           fonts = [ "Iosevka 12" ];
           gaps = {
             outer = 5;
             inner = 10;
             smartBorders = "on";
             # smartGaps = true;
           };
      keybindings = let
        mod = "Mod4"; 
      in lib.mkOptionDefault {
                 "${mod}+Shift+Return" = "exec footclient";
                 "${mod}+q" = "kill";
                 "${mod}+Return" = "exec wofi -c ~/.config/wofi/config --show drun";
                 "${mod}+p" = "exec sh ~/.config/wofer/wofer wofi --dmenu";
                 "${mod}+Control+l" = "exec swaylock -C ~/.config/nixpkgs/roles/radon/recipes/swaylock/lock.conf";
               };
             };
           };

  xdg.configFile = {
    "waybar/config".source= ./sway/waybar/config;
    "waybar/style.css".source= ./sway/waybar/style.css;
    "wofi/config".source= ./sway/wofi/config;
    "wofi/style.css".source= ./sway/wofi/style.css;
    "wofer/wofer".source= ./sway/wofer/wofer;
    "wofer/config".source= ./sway/wofer/config;
    "wofer/extensions/manga" .source= ./sway/wofer/extensions/manga;
  };
}
