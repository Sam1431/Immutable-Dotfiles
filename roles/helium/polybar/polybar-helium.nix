{ pkgs, ... }:
let
  fonts = import ../../../machine/fonts/fonts.nix;
  # clr = import ./themes/horizon.nix;
  clr = import ../../../themes/horizon/horizon.nix;
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
        "bar/helium" = fonts // {
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
          # tray-background = clr.basebg;
          # tray-offset-x = 0;
          # tray-offset-y = 0;
          # tray-padding = 1;

          background = clr.basebg;
          foreground = clr.basefg;

          cursor-click = "pointer";
          cursor-scroll = "pointer";

          modules-left = "overview xmonad volume music";
          modules-center = "";
          modules-right = "date lock userswitch powermenu";
        };

        # modules ---------------------------------------------------------------------

        "module/music" = {
          type = "custom/script";
          exec =
            "${pkgs.playerctl}/bin/playerctl -a --follow metadata --format '%{F${clr.basefg}}{{artist}}%{F${clr.base11}}    %{F${clr.base13}}{{title}}%{F-}' 2>/dev/null";
          tail = true;
          format = "<label>";
          format-background = clr.basebg;
          format-foreground = clr.base14;
          format-padding = 1;
          label-maxlen = 100;


          click-left = "wmctrl -x -a Plexamp";

          label = "%{T2}  %{T2}%{T0}%output%%{T-}";
        };


      # "module/workspaces" = {
      #   type = "custom/script";
      #   exec = "tail -F /tmp/xmonad-wspace";
      #   exec-if = "[ -p /tmp/xmonad-wspace ]";
      #   tail = true;

      #   click-left = "sleep 0.1; xdotool key Super w g";

      #   format = " <label>";
      #   format-background = clr.basebg-alt;
      #   format-foreground = clr.base02;
      #   format-padding = 2;
      # };

        "module/xmonad" = {
          type = "internal/xworkspaces";
          enable-click = false;
          pin-workspaces = false;
          enable-scroll = true;

          icon-0 = "ONE;1";
          icon-1 = "TWO;2";
          icon-2 = "THREE;3";
          icon-3 = "FOUR;4";
          icon-4 = "FIVE;5";
          
          format = "<label-state>";
          label-active-background = clr.basebg-alt;
          label-active = "  %{F${clr.base11}}%{T2}%{T-}%{F-} %index%";
          label-occupied = "";
          label-empty = "";
          label-urgent = "";
          label-active-padding = "1";
        };

        "module/overview" = {
          type = "custom/text";
          content = "%{F${clr.base10}}%{T3} %{T-}%{F-} Menu";
          content-padding = 0;
          content-background = clr.basebg-alt;
          # content-foreground = clr.base09;
          click-left = "sh /home/$USER/.config/nixpkgs/roles/helium/recipes/rofi/appmenu";
        };

        "module/volume" = {
          type = "internal/pulseaudio";
          # sink = "alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2";
          format-volume = "<ramp-volume> <label-volume>";
          format-volume-padding = 2;
          format-volume-background = clr.basebg-alt;
          format-volume-foreground = clr.basefg-alt;
          label-volume = "%percentage:3%%";
          label-muted = "%{F${clr.base10}}%{T3}%{T-}%{F-} mute";
          label-muted-foreground = clr.basefg-alt;
          label-muted-background = clr.basebg-alt;
          label-muted-padding = 2;

          ramp-volume-0 = "%{F${clr.base10}}%{T3}%{T-}%{F-}";
        };

        "module/date" = {
          type = "internal/date";
          interval = 30;
          label = "%time%  ";
          label-padding = 2;
          label-background = clr.basebg;
          label-foreground = clr.basefg-alt;
          time = "%{F${clr.base15}}%{T3}%{T-}%{F-} %H:%M%";
          time-alt = "%{F${clr.base15}}%{T3}%{T-}%{F-} %Y-%m-%d%";
        };

        "module/clock" = {
          type = "internal/date";
          interval = 30;
          label = "%time%";
          label-padding = 10;
          label-background = clr.basebg-alt;
          label-foreground = clr.basefg;
          time = "%{T6}%H:%M%{T-}";
        };

        "module/powermenu" = {
          type = "custom/text";
          content = "%{T2}襤 %{T-}";
          content-padding = 2;
          content-background = clr.basebg-alt;
          content-foreground = clr.basefg-alt;
          click-left = "sh ~/.config/nixpkgs/roles/helium/polybar/scripts/sysmenu";
        };

        "module/userswitch" = {
          type = "custom/text";
          content = "%{T3}%{T-}";
          content-padding = 2;
          content-background = clr.basebg-alt;
          content-foreground = clr.basefg-alt;
          click-left = "kill -s USR1 $(pidof deadd-notification-center)";
        };

        "module/lock" = {
          type = "custom/text";
          content = "%{T2} %{T-}";
          content-padding = 2;
          content-background = clr.basebg-alt;
          content-foreground = clr.basefg-alt;
          click-left = "betterlockscreen -l -t Yare Yare Daze.. ";
        };
      };
    };
  };
}

