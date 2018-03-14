{ pkgs }:

let
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  packages.myVimPackage = with pkgs.vimPlugins // plugins; {
    start = [
      #vim-nerdtree-tabs
      #vim-nerdtree-git-plugin
      #vim-devicons
      #vim-nerdtree-syntax-highlight
      #vim-mru
      #vim-indentline

      tools.fugitive
      tools.nerdtree
      tools.easymotion
      tools.emmet
      tools.ale
      tools.editorconfig

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

    nmap <silent> <F3> :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  '';
}
