{
    kitty = import ./recipes/kitty/kitty.nix;
    foot = import ./recipes/foot/foot.nix;
    doom = import ./recipes/doom/doom.nix;
    alacritty = import ./recipes/alacritty/alacritty.nix;
    compton = import ./recipes/compton/compton.nix;
    git = import ./recipes/git/git.nix;
    ncmpcpp = import ./recipes/ncmpcpp/ncmpcpp.nix;
    neovim = import ./recipes/neovim/neovim.nix;
    nur = import ./recipes/nur/nur-progs.nix;
    nushell = import ./recipes/nushell/nushell.nix;
    polybar = import ./polybar/polybar.nix;
    qutebrowser = import ./recipes/qutebrowser/qutebrowser.nix;
    starship = import ./recipes/starship/starship.nix;
    zsh = import ./recipes/zsh/zsh.nix;
    mako = import ./recipes/mako/mako.nix;
    xdg = import ./recipes/xdg/xdg.nix;
    xmonad = import ./xmonad/xmonad.nix;
    core = import ./app.nix;
    desktop = import ./sway.nix;
}
