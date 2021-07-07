{ pkgs, config, lib, ...}:

{
  programs.kitty = { 
    enable = true;
    font = { 
      name = "Iosevka Nerd Font";
      size = 11;
    };
   
      settings = {
 
        shell = "nu";
        foreground = "#abb2bf";
        background = "#282c34";
        selection_foreground = "#2e3440";
        selection_background = "#d8dee9";
        url_color = "#0087BD";
        cursor = "#abb2bf";
        window_padding_width = "12";
        enable_audio_bell = "no";


            color0 = "#586275";  # black
            color1 = "#e06c75";  # red
            color2 = "#98c379";  # green
            color3 = "#d19a66";  # yellow
            color4 = "#61afef";  # blue
            color5 = "#c678dd";  # magenta
            color6 = "#56b6c2";  # cyan
            color7 = "#dde2ed";  # white
            
            color8 = "#586275";   # bright black
            color9 = "#e06c75";   # bright red
            color10 = "#98c379";   # bright green
            color11 = "#d19a66";   # bright yellow
            color12 = "#61afef";   # bright blue
            color13 = "#c678dd";   # bright magenta
            color14 = "#56b6c2";   # bright cyan
            color15 = "#e6efff";   # bright white


     #   # black
     #   color0 = "#3B4252";
     #   color8 = "#4C566A";
     #   # red
     #   color1 = "#BF616A";
     #   color9 = "#BF616A";
     #   # green
     #   color2 = "#A3BE8C";
     #   color10 = "#A3BE8C";
     #   # yellow
     #   color3 = "#EBCB8B";
     #   color11 = "#EBCB8B";
     #   # blue
     #   color4 = "#81A1C1";
     #   color12 = "#81A1C1";
     #   # magenta
     #   color5 = "#B48EAD";
     #   color13 = "#B48EAD";
     #   # cyan
     #   color6 = "#88C0D0";
     #   color14 = "#8FBCBB";
     #   # white
     #   color7 = "#E5E9F0";
     #   color15 = "#ECEFF4";
    };
  };
} 
