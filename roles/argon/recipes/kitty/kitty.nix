{ pkgs, config, lib, ...}:

{
  programs.kitty = { 
    enable = true;
    font = { 
      name = "Iosevka Nerd Font";
      size = 11;
    };
   
      settings = {
 
        shell = "zsh";
        foreground = "#ffffff";
        background = "#1a2026";
        selection_foreground = "#2e3440";
        selection_background = "#d8dee9";
        url_color = "#0087BD";
        cursor = "#abb2bf";
        window_padding_width = "12";



color0  =  "#29343d";
color1  =  "#f9929b";
color2  =  "#7ed491";
color3  =  "#fbdf90";
color4  =  "#a3b8ef";
color5  =  "#ccaced";
color6  =  "#9ce5c0";
color7  =  "#ffffff";
color8  =  "#3b4b58";
color9  =  "#fca2aa";
color10  =  "#a5d4af";
color11  =  "#fbeab9";
color12  =  "#bac8ef";
color13  =  "#d7c1ed";
color14  =  "#c7e5d6";
color15  =  "#eaeaea";

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
