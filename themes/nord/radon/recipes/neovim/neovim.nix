{ config, pkgs, ... }:

{
  programs.neovim = {
      package = pkgs.neovim-nightly;
      enable = true;
      vimAlias = true;
      extraConfig = builtins.readFile ./init.vim;
      plugins = with pkgs.vimPlugins; [
        
        # UI
        goyo-vim
        dashboard-nvim
        nord-vim
        vim-devicons
        vim-airline
        ranger-vim
        vim-clap
        clang_complete
        nvim-tree-lua
        vim-packer
       # nvim-nonicons
        vim-airline-themes
        nerdtree
        neco-ghc
        neosnippet-snippets
        deoplete-nvim
        vim-bufferline
        # tagbar # <leader>5
        minimap-vim

        # RUST
        rust-vim
        rust-tools-nvim

        # NIX
        vim-nix
        vim-addon-nix
        vim2nix

        # PYTHON
        python-mode
        jedi-vim

        # ORG-MODE
        vim-orgmode
        VimOrganizer

        # MARKDOWN
        vim-markdown
        vim-markdown-toc

        # COMPLETION / SYNTAX
        YouCompleteMe
        vim-css-color

        # GITHUB
        vim-gitgutter # status in gutter
        vim-github-dashboard
        vim-fugitive # Gblame
      ];
    };
  }
