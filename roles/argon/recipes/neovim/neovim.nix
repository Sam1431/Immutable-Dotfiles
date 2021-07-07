{ config, pkgs, ... }:

{
  programs.neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./init.vim;
      plugins = with pkgs.vimPlugins; [
        vim-nix
        haskell-vim
        goyo-vim
        dashboard-nvim
        nord-vim
        vim-gitgutter # status in gutter
        vim-devicons
        vim-airline
        nvim-tree-lua
       # nvim-nonicons
        vim-airline-themes
        nerdtree
        neco-ghc
        vim-orgmode
        neosnippet-snippets
        deoplete-nvim
        vim-bufferline
        tagbar # <leader>5
        vim-fugitive # Gblame
      ];
    };
  }
