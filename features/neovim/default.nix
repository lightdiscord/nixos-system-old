{ pkgs }:

let
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      #nerdtree
      #vim-nerdtree-tabs
      #vim-nerdtree-git-plugin
      #vim-devicons
      #vim-nerdtree-syntax-highlight
      #vim-easymotion
      #vim-mru
      #editorconfig
      #emmet
      #vim-indentline
      #vim-ale

      tools.fugitive

      fun.discord

      themes.colors-lucid

      langs.nix
      langs.rust
      langs.toml
    ];
    opt = [];
  };

  customRC = ''
    if (has("termguicolors"))
      set termguicolors
    endif

    set background=dark
    colorscheme lucid
  '';
}
