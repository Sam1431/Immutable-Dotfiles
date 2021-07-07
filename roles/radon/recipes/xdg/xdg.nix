{ pkgs, config, lib, ... }:

{
  xdg.configFile = {
    "waybar/config".source= ../../sway/waybar/config;
    "waybar/style.css".source= ../../sway/waybar/style.css;
    "wofi/config".source= ../../sway/wofi/config;
    "wofi/style.css".source= ../../sway/wofi/style.css;
    "wofer/wofer".source= ../../sway/wofer/wofer;
    "wofer/config".source= ../../sway/wofer/config;
    "wofer/extensions/manga".source= ../../sway/wofer/extensions/manga;
  };
}
