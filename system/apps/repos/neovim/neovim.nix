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
        gruvbox # colorscheme
        vim-gitgutter # status in gutter
        # vim-devicons
        vim-airline
        vim-airline-themes
        nerdtree
        # vim-clap
        # telescope-nvim
        fzf-vim
        # neosnippet-snippets
        # deoplete-nvim
        vim-bufferline
        fzf-vim
        tagbar # <leader>5
        vim-fugitive # Gblame
      ];
    };
  }
