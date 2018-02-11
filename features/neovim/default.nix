{ pkgs }:

let
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      ## File tree
      #nerdtree
      #vim-nerdtree-tabs
      #vim-nerdtree-git-plugin
      #vim-devicons
      #vim-nerdtree-syntax-highlight

      ## Utils
      #vim-easymotion
      #vim-mru
      #vim-editorconfig
      #vim-emmet
      vim-discord
      vim-indentline
      #vim-ale

      ## Git
      #vim-fugitive

      ## Airline
      #vim-airline
      #vim-airline-themes

      ## Themes
      #colibri-vim
      gruvbox
      vim-one
      #vim-jellybeans
      #vim-tender
      #vim-colors-lucid

      ## Languages
      #vim-javascript
      #vim-vue
      #rust-vim
      vim-nix
      #vim-graphql
      vim-toml
      #vim-fish
      spacevim
    ];
    opt = [];
  };

  customRC = ''
    source /home/arnaud/.config/nvim/init.vim
    let g:chromatica#libclang_path='${pkgs.llvmPackages.clang.cc}/lib/libclang.so'
    let g:spacevim_colorscheme = 'one'
    let g:spacevim_colorscheme_bg = 'dark'
    colorscheme one
  '';
}
