{ pkgs, ... }:
let
  fonts = import ./themes/fonts.nix;
  colours = import ./themes/horizon.nix;
in {
  services = {
    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        githubSupport = true;
        pulseSupport = true;
      };

      # script = "~/.scripts/polybar/launch";
      script = "";

      # - bars ------------------------------------------------------------------------
      config = {

        # XMONAD #
        "bar/xmonad" = fonts // {
          monitor = "LVDS-1";
          override-redirect = false;

          enable-ipc = true;

          width = "100%";
          height = "34";
          bottom = false;
          fixed-center = true;
          line-size = "2";

          # tray-position = "center";
          # tray-detached = true;
          # tray-maxsize = 16;
          # tray-background = colours.basebg;
          # tray-offset-x = 0;
          # tray-offset-y = 0;
          # tray-padding = 1;

          background = colours.basebg;
          foreground = colours.basefg;

          cursor-click = "pointer";
          cursor-scroll = "ns-resize";

          modules-left = "workspaces layout volume mode music";
          modules-center = "";
          modules-right = "date wincontrol caffeine lock userswitch powermenu";
        };

        # modules ---------------------------------------------------------------------

        "module/wincontrol" = {
          type = "custom/script";
          exec = "tail -f /tmp/xmonad-curwin";
          exec-if = "[ -p /tmp/xmonad-curwin ]";
          tail = true;

          format = "<label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.basefg-alt;
          format-padding = 2;

          click-left = "sleep 0.1; xdotool key Super w c";

          label = " %output%";
        };

        "module/layout" = {
          type = "custom/script";
          exec = "tail -f /tmp/xmonad-layout";
          exec-if = "[ -p /tmp/xmonad-layout ]";
          tail = true;

          format = "<label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.basefg-alt;
          format-padding = 1;

          click-left = "sleep 0.1; xdotool key Super space";

          label = "%output%";
        };

        "module/music" = {
          type = "custom/script";
          exec =
            "${pkgs.playerctl}/bin/playerctl --follow metadata --format '%{F${colours.basefg}}{{artist}}%{F${colours.base11}}    %{F${colours.base13}}{{title}}%{F-}' 2>/dev/null";
          tail = true;
          format = "<label>";
          format-background = colours.basebg;
          format-foreground = colours.base14;
          format-padding = 3;
          label-maxlen = 100;


          click-left = "wmctrl -x -a Plexamp";

          label = "%{T2} %{T2}  %{T0}%output%%{T-}";
        };


      # "module/workspaces" = {
      #   type = "custom/script";
      #   exec = "tail -F /tmp/xmonad-wspace";
      #   exec-if = "[ -p /tmp/xmonad-wspace ]";
      #   tail = true;

      #   click-left = "sleep 0.1; xdotool key Super w g";

      #   format = " <label>";
      #   format-background = colours.basebg-alt;
      #   format-foreground = colours.base02;
      #   format-padding = 2;
      # };

        "module/mode" = {
          type = "custom/script";
          exec = "tail -F /tmp/xmonad-events";
          exec-if = "[ -p /tmp/xmonad-events ]";
          tail = true;

          format = " <label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.basebg;
          format-padding = 2;
        };

        "module/tray" = {
          type = "custom/script";
          exec = "tail -F /tmp/xmonad-states";
          exec-if = "[ -p /tmp/xmonad-states ]";
          tail = true;

          format = "   <label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.basebg;
          format-padding = 1;
        };

        "module/caffeine" = {
          type = "custom/script";
          exec = "tail -F /tmp/xmonad-caffeine";
          exec-if = "[ -p /tmp/xmonad-caffeine ]";
          tail = true;

          click-left = "~/.scripts/caffeine";

          format = "<label>";
          format-background = colours.basebg-alt;
          format-foreground = colours.base02;
          label = "  %output% ";
          content-padding = 3;
        };

        "module/volume" = {
          type = "internal/pulseaudio";
          # sink = "alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2";
          format-volume = "<ramp-volume> <label-volume>";
          format-volume-padding = 2;
          format-volume-background = colours.basebg-alt;
          format-volume-foreground = colours.basefg-alt;
          label-volume = "%percentage:3%%";
          label-muted = "%{F${colours.base10}}%{T3}%{T-}%{F-} mute";
          label-muted-foreground = colours.basefg-alt;
          label-muted-background = colours.basebg-alt;
          label-muted-padding = 2;

          ramp-volume-0 = "%{F${colours.base10}}%{T3}%{T-}%{F-}";
        };

        "module/date" = {
          type = "internal/date";
          interval = 30;
          label = "%time%  ";
          label-padding = 2;
          label-background = colours.basebg;
          label-foreground = colours.basefg-alt;
          time = "%{F${colours.base15}}%{T3}%{T-}%{F-} %H:%M%";
          time-alt = "%{F${colours.base15}}%{T3}%{T-}%{F-} %Y-%m-%d%";
        };

        "module/clock" = {
          type = "internal/date";
          interval = 30;
          label = "%time%";
          label-padding = 10;
          label-background = colours.basebg-alt;
          label-foreground = colours.basefg;
          time = "%{T6}%H:%M%{T-}";
        };

        "module/powermenu" = {
          type = "custom/text";
          content = "%{T2}襤 %{T-}";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "sleep 0.1; xdotool key Super q m";
        };

        "module/userswitch" = {
          type = "custom/text";
          content = "%{T3}%{T-}";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "~/.scripts/switch";
        };

        "module/lock" = {
          type = "custom/text";
          content = "%{T2} %{T-}";
          content-padding = 2;
          content-background = colours.basebg-alt;
          content-foreground = colours.basefg-alt;
          click-left = "sleep 0.1; xdotool key Super q l";
        };
      };
    };
  };
}

