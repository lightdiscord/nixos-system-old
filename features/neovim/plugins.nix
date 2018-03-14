{ vimUtils, fetchgit }:

let
  build-vim = vimUtils.buildVimPluginFrom2Nix;

  build = ({name, owner, rev, sha256}: build-vim {
    name = name;
    src = fetchgit {
      url = "https://github.com/${owner}/${name}";
      rev = rev;
      sha256 = sha256;
    };
    dependencies = [];
  });
in {
  themes = {
    colors-lucid = build { 
      name = "vim-colors-lucid";
      owner = "cseelus";
      rev = "a2bc8f68f7c408bb8525e5f0e2405931e5bf240c";
      sha256 = "08nhh8s02h5jv686n4vr7cgb28czpmiczsp8basn1457nvkwbins";
    };

    airline = build {
      name = "vim-airline-themes";
      owner = "vim-airline";
      rev = "4b7f77e770a2165726072a2b6f109f2457783080";
      sha256 = "02wbch9mbj0slafd5jrklmyawrxpisf8c3f5c72gq30j8hlyb86n";
    };
  };

  langs = {
    nix = build {
      name = "vim-nix";
      owner = "LnL7";
      rev = "36c5feb514930e8fb8e2f4567d6b0d9e806fc2eb";
      sha256 = "1v0vm0h5j6zzwhm5gw3xcmckswma3a5kxyli34i8hy14yli0ff3d";
    };

    rust = build {
      name = "rust.vim";
      owner = "rust-lang";
      rev = "8e75da9834abb22f8d7ece3f4ca4324a14fa18a6";
      sha256 = "1mn4jijfzz2jq215dnwkq5gxiw0ysmvrsrvq4aypr2ms2040iqiq";
    };

    toml = build {
      name = "vim-toml";
      owner = "cespare";
      rev = "624f02475080ea26d9430b8d31d7c3199b0ec939";
      sha256 = "0frjdv50rhd3awrddq25x4l22ca15i5587pgcmvwxz92y52484lx";
    };
  };

  fun = {
    discord = build {
      name = "discord.nvim";
      owner = "aurieh";
      rev = "a1307418570c3ef5bd46b8df2cbd5598de891b2b";
      sha256 = "19lay10w39yjfyxr82hfsf2j8bbmmlsqq9ddf4j0c086yw02vlv7";
    };
  };

  tools = {
    fugitive = build {
      name = "vim-fugitive";
      owner = "tpope";
      rev = "b82abd5bd583cfb90be63ae12adc36a84577bd45";
      sha256 = "0y3fkw7f5gqb339qlby19f444085c929gjbmbibmgig7hrarqrz4";
    };

    nerdtree = build {
      name = "nerdtree";
      owner = "scrooloose";
      rev = "a172d7cfcb4fe9b927dcc24184204fc89d826301";
      sha256 = "1nfk1j2n2jgrdhcahva1kq3qjj4fdn1x20xxvgl88v3j3fj62n0f";
    };

    easymotion = build {
      name = "vim-easymotion";
      owner = "easymotion";
      rev = "342549e7a1e5b07a030803e0e4b6f0415aa51275";
      sha256 = "1glv4s95v8xxj47n0jzjxd0pxphnnpgzyd384d2bh0ql1xgf320v";
    };

    emmet = build {
      name = "emmet-vim";
      owner = "mattn";
      rev = "350f0ba10b9ee65837fc5b04a993b14a7a10e5ac";
      sha256 = "0439a3jd8v45nw6sl1gmhcz6w5ca5v2db0slahxg504zjs5jpivw";
    };

    ale = build {
      name = "ale";
      owner = "w0rp";
      rev = "92e6e4d1ba482a4d2d89d850f660c67ccf8a28eb";
      sha256 = "11zxh6n8qwm6rhx2i5fxj92r19yjfc5jpgby7kj3wwd9qgkzjxkk";
    };

    editorconfig = build {
      name = "editorconfig-vim";
      owner = "editorconfig";
      rev = "0abb0634a8bf3c760a283e9e7475594b83869a46";
      sha256 = "1wazl37ivn9nhsy296g1ncvvwc78930lbp8arhwavr52mzpfji21";
    };

    airline = build {
      name = "vim-airline";
      owner = "vim-airline";
      rev = "958f78335eafe419ee002ad58d358854323de33a";
      sha256 = "1h0a0rsnbbwhw55r2hcpfkxqamnx62jzqb451lh3ipvfs0ral6w7";
    };

    ctrlp = build {
      name = "ctrlp.vim";
      owner = "kien";
      rev = "564176f01d7f3f7f8ab452ff4e1f5314de7b0981";
      sha256 = "1nzzii9g4ckf561csrg7nclnsb6gr5lgghmlhdsxabkcp2lkhnmr";
    };
  };
}
