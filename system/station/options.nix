let 
  horizon = {
    clr = import ./setup/colorschemes/horizon.nix;
    color = import ./setup/colorschemes/horizon.nix;
  };


  dracula = {
    clr = import ./setup/colorschemes/ant.nix;
    color = import ./setup/colorschemes/ant.nix;
  };


  ephemeral = {
    clr = import ./setup/colorschemes/ephemeral.nix;
    color = import ./setup/colorschemes/ephemeral.nix;
  };


  lovelace = {
    clr = import ./setup/colorschemes/lovelace.nix;
    color = import ./setup/colorschemes/lovelace.nix;
  };


  dark = {
    clr = import ./setup/colorschemes/nord.nix;
    color = import ./setup/colorschemes/nord.nix;
  };


  onedark = {
    clr = import ./setup/colorschemes/one.nix;
    color = import ./setup/colorschemes/one.nix;
  };

in 
{
  imports = [ horizon ];
}
