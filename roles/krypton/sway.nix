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

       startup = [{ command = "swaybg --mode fill --image ~/.config/nixpkgs/machine/wallpaper/abstract/mechanical-key.png"; }
                  { command = "mpd"; }
                 # { command = "foot -s"; }
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
             outer = 10;
             inner = 8;
             smartBorders = "on";
             # smartGaps = true;
           };
      keybindings = let
        mod = "Mod4"; 
      in lib.mkOptionDefault {
                 "${mod}+Shift+Return" = "exec kitty";
                 "${mod}+q" = "kill";
                 "${mod}+Return" = "exec wofi -c ~/.config/wofi/config --show drun";
                 "${mod}+p" = "exec sh ~/.config/wofer/wofer wofi --dmenu";
                 "${mod}+Control+Alt+l" = "exec swaylock -C ~/.config/nixpkgs/roles/radon/recipes/swaylock/lock.conf";
                 "${mod}+Control+Down" = "resize grow height 10 px";
                 # "${mod}+Control+Escape" = "mode default";
                 "${mod}+Control+Left" = "resize shrink width 10 px";
                 # "${mod}+Control+Return" = "mode default";
                 "${mod}+Control+Right" = "resize grow width 10 px";
                 "${mod}+Control+Up" = "resize shrink height 10 px";
                 "${mod}+Control+h" = "resize shrink width 30 px";
                 "${mod}+Control+j" = "resize grow height 20 px";
                 "${mod}+Control+k" = "resize shrink height 20 px";
                 "${mod}+Control+l" = "resize grow width 30 px";
};
     # modes = {
     #   resize = {
     #              Down = "resize grow height 10 px";
     #              Escape = "mode default";
     #              Left = "resize shrink width 10 px";
     #              Return = "mode default";
     #              Right = "resize grow width 10 px";
     #              Up = "resize shrink height 10 px";
     #              h = "resize shrink width 30 px";
     #              j = "resize grow height 20 px";
     #              k = "resize shrink height 20 px";
     #              l = "resize grow width 30 px";
     #            };
     #          };
             };
           };
}
