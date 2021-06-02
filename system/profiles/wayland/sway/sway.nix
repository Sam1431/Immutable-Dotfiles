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

       bars = [{ command = "waybar"; }];
       startup = [{ command = "swaybg --mode fill --image ~/.config/nixpkgs/role/config/wall/solarized.jpg"; }];
       colors = {
         focused = {
           background = "#9da98d";
           border = "#9da98d";
           text = "#3a3a3a";
           indicator = "#778564";
           childBorder = "#5e81ac";
      };
         focusedInactive = {
           background = "#464646";
           border = "#464646";
           text = "#eceff4";
           indicator = "#464646";
           childBorder = "#5e81ac";
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
           background = "#464646";
           border = "#464646";
           text = "#eceff4";
           indicator = "#464646";
           childBorder = "#464646";
      };

    };
           focus.followMouse = true;
           fonts = [ "Iosevka 12" ];
           gaps = {
             outer = 1;
             inner = 1;
             smartBorders = "on";
           };
      keybindings = let
        mod = "Mod4"; 
      in lib.mkOptionDefault {
                 "${mod}+Shift+Return" = "exec alacritty";
                 "${mod}+q" = "kill";
                 "${mod}+Return" = "exec wofi -c ~/.config/wofi/config";
               };
             };
         };

  imports = [
     ../../../station/utilities/zsh.nix
     ../../../station/utilities/nushell.nix
     ../../../station/utilities/starship.nix
  ];

}
