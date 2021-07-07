{ pkgs, config, lib, ...}:

{
  programs.foot = { 
        enable = true;
        server.enable = false;
        settings = {
         main = { 
           font = "Iosevka Nerd Font:size=8";
           pad = "12x12";
           shell = "nu";
         };

         scrollback = { 
           lines = "4096";
           multiplier = "1";
         };

         cursor = {
           style = "block";
           blink = "no";
         };

         mouse = {
           hide-when-typing = "yes";
         };

         colors = { 
           
            alpha = "1.0";
            foreground = "d8dee9";
            background = "2e3440";
            regular0 = "3b4252";  # black
            regular1 = "bf616a";  # red
            regular2 = "a3be8c";  # green
            regular3 = "ebcb8b";  # yellow
            regular4 = "81a1c1";  # blue
            regular5 = "b48ead";  # magenta
            regular6 = "88c0d0";  # cyan
            regular7 = "e5e9f0";  # white
            bright0 = "4c566a";   # bright black
            bright1 = "bf616a";   # bright red
            bright2 = "a3be8c";   # bright green
            bright3 = "ebcb8b";   # bright yellow
            bright4 = "81a1c1";   # bright blue
            bright5 = "b48ead";   # bright magenta
            bright6 = "8fbcbb";   # bright cyan
            bright7 = "eceff4";   # bright white
          };

          tweak = {
            allow-overflowing-double-width-glyphs = true;
          };
      };
   };
}
