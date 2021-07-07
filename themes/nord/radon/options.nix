{ pkgs, config, lib, ... }:
let 
  clr = import ../../machine/colorschemes/horizon.nix;
  color = import ../../machine/colorschemes/horizon.nix;
in
  {
  
    imports = [

       # APP CONFIG RECIPE

       ./recipes/git/git.nix
       ./recipes/ncmpcpp/ncmpcpp.nix
       ./recipes/neovim/neovim.nix
       ./recipes/nushell/nushell.nix
       ./recipes/starship/starship.nix
       ./recipes/zsh/zsh.nix

       # TERMINAL RECIPES

#       ./recipes/alacritty/alacritty.nix
       ./recipes/kitty/kitty.nix
       ./recipes/foot/foot.nix

       # SYSTEM APPS / DESKTOP-RECIPES

       ./recipes/nur/nur-progs.nix
       ./sway.nix
       ./app.nix
     ];
   }
