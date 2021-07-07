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
            foreground = "abb2bf";
            background = "282c34";
            
            regular0 = "586275";  # black
            regular1 = "e06c75";  # red
            regular2 = "98c379";  # green
            regular3 = "d19a66";  # yellow
            regular4 = "61afef";  # blue
            regular5 = "c678dd";  # magenta
            regular6 = "56b6c2";  # cyan
            regular7 = "828791";  # white
           
            bright0 = "586275";   # bright black
            bright1 = "e06c75";   # bright red
            bright2 = "98c379";   # bright green
            bright3 = "d19a66";   # bright yellow
            bright4 = "61afef";   # bright blue
            bright5 = "c678dd";   # bright magenta
            bright6 = "56b6c2";   # bright cyan
            bright7 = "e6efff";   # bright white
          };

          tweak = {
            allow-overflowing-double-width-glyphs = true;
          };
      };
   };
}
