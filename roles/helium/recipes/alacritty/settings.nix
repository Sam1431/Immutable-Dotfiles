let
  clr = import ../../../../themes/horizon/horizon.nix;
in
  {
    env = {
     "TERM" = "xterm-256color";
  };

  background_opacity = 0.97;

#### PADDING

  window = {
    padding.x = 12;
    padding.y = 12;
    decorations = "Full";
  };

#### FONTS ----------------

  font = {
    size = 8.0;
    use_thin_strokes = true;

    normal = {
      family = "Iosevka";
      style = "Regular";
    };

    bold = {
      family = "Iosevka";
      style = "Bold";
    };

    italic = {
      family = "Iosevka";
      style = "Italic";
    };
  };

#### STYLING --------------

  cursor.style = "Block";

  shell = {
    program = "zsh";
  };

#### COLOR SCHEME --------------

  colors = {
    # Default colors
    primary = {
      background = clr.background;
      foreground = clr.foreground;
    };

  normal = {
    black =   clr.black;
    red =     clr.red;
    green =   clr.green;
    yellow =  clr.yellow;
    blue =    clr.blue;
    magenta = clr.magenta;
    cyan =    clr.cyan;
    white =   clr.white;
};
  bright = {
    black =   clr.black-br;
    red =     clr.red-br;
    green =   clr.green-br;
    yellow =  clr.yellow-br;
    blue =    clr.blue-br;
    magenta = clr.magenta-br;
    cyan =    clr.cyan-br;
    white =   clr.white-br;
};
  };
}
