{ pkgs, config, lib, ... }:
let 
  clr = import ../../machine/colorschemes/horizon.nix;
  color = import ../../machine/colorschemes/horizon.nix;
in
  {
  
    imports = [
       ./recipes/alacritty/alacritty.nix
       ./recipes/compton/compton.nix
       ./recipes/git/git.nix
       ./recipes/ncmpcpp/ncmpcpp.nix
       ./recipes/neovim/neovim.nix
       ./recipes/nur/nur-progs.nix
     #  ../../recipes/nushell/nushell.nix
     #  ./polybar/polybar.nix
     #  ./recipes/qutebrowser.nix
       ./recipes/starship/starship.nix
       ./recipes/zsh/zsh.nix


       ./xmonad/xmonad.nix

       ./app.nix
     ];
   }
