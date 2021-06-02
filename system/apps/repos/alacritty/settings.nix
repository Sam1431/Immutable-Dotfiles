 {
    env = {
     "TERM" = "xterm-256color";
  };

  background_opacity = 1.0;

#### PADDING

  window = {
    padding.x = 12;
    padding.y = 12;
    decorations = "Full";
  };

#### FONTS ----------------

  font = {
    size = 8.4;
    use_thin_strokes = true;

    normal = {
      family = "Iosevka Slab";
      style = "Regular";
    };

    bold = {
      family = "Iosevka Slab";
      style = "Regular";
    };

    italic = {
      family = "Iosevka Slab";
      style = "Italic";
    };
  };

#### STYLING --------------

  cursor.style = "Block";

  shell = {
    program = "tmux";
  };

#### COLOR SCHEME --------------

  colors = {
    # Default colors
    primary = {
      background = "#282828";
      foreground = "#ebdbb2";
    };

  normal = {
    black =   "#5c5151";
    red =     "#cc241d";
    green =   "#a0cf44";
    yellow =  "#d79921";
    blue =    "#458588";
    magenta = "#b16286";
    cyan =    "#689d6a";
    white =   "#a89984";
};
  bright = {
    black =   "#928374";
    red =     "#fb4934";
    green =   "#a0cf44";
    yellow =  "#fabd2f";
    blue =    "#83a598";
    magenta = "#d3869b";
    cyan =    "#8ec07c";
    white =   "#ebdbb2";
};
  };
}
