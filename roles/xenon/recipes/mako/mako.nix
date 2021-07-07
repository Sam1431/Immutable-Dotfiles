{ pkgs, lib, config, ... }:

{
    programs.mako = {
        enable = true;
        width = 300;
        margin = "10";
        padding = "10";
        borderSize = 1;
        borderRadius = 5;
        defaultTimeout = 5000;
        borderColor = "#434C5E";
        backgroundColor = "#2E3440";
        anchor = "top-right";
        layer = "overlay";
        font = "Iosevka Nerd Font 11";
      };
  }
