{ pkgs }:

let
  build = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  nerdtree = build {
    name = "nerdtree";
    src = pkgs.fetchgit {
      url = "https://github.com/scrooloose/nerdtree";
      rev = "b89de09810b646ec2107160db3af9e530d20446c";
      sha256 = "0saa3iqa5zfn4m61iq661dszq4fnqjgrhmigzx0r8s4cskglg3jc";
    };
    dependencies = [];
  };
  colibri-vim = build {
    name = "colibri-vim";
    src = pkgs.fetchgit {
      url = "https://github.com/archSeer/colibri.vim";
      rev = "fd74cec1c0933704413896dfd6b4a5009b8f5191";
      sha256 = "0pcr23ibsyx2i1mvj7z3wz0kg231mby56j033s79lhfznai3masf";
    };
  };
  vim-javascript = build {
    name = "vim-javascript";
    src = pkgs.fetchgit {
      url = "https://github.com/pangloss/vim-javascript";
      rev = "a0e1442d86a070331c800107fbee6394ee6d3d08";
      sha256 = "1rlh444a0n4jvwiqdcpd905nk28rm8mn29jsnhs27pwsqqmpqll3";
    };
  };
  vim-vue = build {
    name = "vim-vue";
    src = pkgs.fetchgit {
      url = "https://github.com/posva/vim-vue";
      rev = "db295dbf134392d2328bf246f4bea9c3685573ad";
      sha256 = "1dax20d2kxrfj4hdvazcfk93xnw4icck52ba9fmaxr9bcq0k7n91";
    };
  };
  vim-graphql = build {
    name = "vim-graphql";
    src = pkgs.fetchgit {
      url = "https://github.com/jparise/vim-graphql";
      rev = "123230760fe915bedc6bc26c38ad673085163a7e";
      sha256 = "079gl2yw7nr80hpd2kxrzj0qm2706p41g0plv6la1dxafavrpnrb";
    };
  };
  vim-toml = build {
    name = "vim-toml";
    src = pkgs.fetchgit {
      url = "https://github.com/cespare/vim-toml";
      rev = "1fecb3a9d5a1c1bd0e24de7bb9329abb40bf4d30";
      sha256 = "0f3v0rqxpf8v958nb9cx7192pm9m4y45b1r216sia4zramp54lfp";
    };
  };
  vim-fish = build {
    name = "vim-fish";
    src = pkgs.fetchgit {
      url = "https://github.com/dag/vim-fish";
      rev = "50b95cbbcd09c046121367d49039710e9dc9c15f";
      sha256 = "1yvjlm90alc4zsdsppkmsja33wsgm2q6kkn9dxn6xqwnq4jw5s7h";
    };
  };
  vim-easymotion = build {
    name = "vim-easymotion";
    src = pkgs.fetchgit {
      url = "https://github.com/easymotion/vim-easymotion";
      rev = "342549e7a1e5b07a030803e0e4b6f0415aa51275";
      sha256 = "1glv4s95v8xxj47n0jzjxd0pxphnnpgzyd384d2bh0ql1xgf320v";
    };
  };
  vim-mru = build {
    name = "vim-mru";
    src = pkgs.fetchgit {
      url = "https://github.com/vim-scripts/mru.vim";
      rev = "9f25db66393a6467fae0ac04ae6565e8471023c3";
      sha256 = "1m1psfd1vlrwa256yq755rkbfyk6bs0di81z9p0i33z2wr125h4p";
    };
  };
  vim-airline = build {
    name = "vim-airline";
    src = pkgs.fetchgit {
      url = "https://github.com/vim-airline/vim-airline";
      rev = "6c8d0f5e6af878db71b2dc44ccf1d1417381d6a0";
      sha256 = "0azrapbb3w84c62kcbrycm75qmwdfz38852sv7cccwb7v1xgj9ab";
    };
  };
  vim-airline-themes = build {
    name = "vim-airline-themes";
    src = pkgs.fetchgit {
      url = "https://github.com/vim-airline/vim-airline-themes";
      rev = "52dfa2b6c0dc2fd7a0e92954030893de3d173105";
      sha256 = "0m65xmg259781r1wk8dz0d0diiayqyl1wahsb2fdqs369wwx4irr";
    };
  };
  vim-nerdtree-tabs = build {
    name = "vim-nerdtree-tabs";
    src = pkgs.fetchgit {
      url = "https://github.com/jistr/vim-nerdtree-tabs";
      rev = "47bbe5afc26f701f08d31b2bbdb660f117367ded";
      sha256 = "0a1gqdvmpa4gylnb7sxs6zr89i60fl16p477200x18hgh2zd2v02";
    };
  };
  vim-nerdtree-git-plugin = build {
    name = "vim-nerdtree-git-plugin";
    src = pkgs.fetchgit {
      url = "https://github.com/Xuyuanp/nerdtree-git-plugin";
      rev = "6a9b3122cb89b3a45ec444f9787a895125aca8aa";
      sha256 = "0yiyz81zqlccglclp3rmlb76sxpqy9alqbv8ih0hrvfpjx5hd8sy";
    };
  };
  vim-fugitive = build {
    name = "vim-fugitive";
    src = pkgs.fetchgit {
      url = "https://github.com/tpope/vim-fugitive";
      rev = "5032d9ee72361dc3cfaae1a9b3353211203e443f";
      sha256 = "1zx5l8lx7440l3pvs2bx81r3wmpvbmq7qs8ziz9lvlp91s7dqy88";
    };
  };
  vim-devicons = build {
    name = "vim-devicons";
    src = pkgs.fetchgit {
      url = "https://github.com/ryanoasis/vim-devicons";
      rev = "a3e50225a8d544c9eff9c53c5405269a1b2b29f8";
      sha256 = "0glnwqnaw28g41zd9c3wvcsk6fmiphlwiq80lskbyn1pxfb3h14m";
    };
  };
  vim-editorconfig = build {
    name = "vim-editorconfig";
    src = pkgs.fetchgit {
      url = "https://github.com/editorconfig/editorconfig-vim";
      rev = "0abb0634a8bf3c760a283e9e7475594b83869a46";
      sha256 = "1wazl37ivn9nhsy296g1ncvvwc78930lbp8arhwavr52mzpfji21";
    };
  };
  vim-jellybeans = build {
    name = "vim-jellybeans";
    src = pkgs.fetchgit {
      url = "https://github.com/nanotech/jellybeans.vim";
      rev = "36f4f82bd7749928ba4e61a58b2e76effb6ecd66";
      sha256 = "11j7i4xqcy6z9r0phklrrdczkkzx30n4p8chqiasfyv64hyywv2f";
    };
  };
  vim-nerdtree-syntax-highlight = build {
    name = "vim-nerdtree-syntax-highlight";
    src = pkgs.fetchgit {
      url = "https://github.com/tiagofumo/vim-nerdtree-syntax-highlight";
      rev = "30dcd52f2cda981555f2d83e1a9ff876e7715f49";
      sha256 = "1fa41xdmx8n5h3hmd0ibrlh8ydf8s2m9jfpspwfqj7f1kdm1n157";
    };
  };
  vim-emmet = build {
    name = "vim-emmet";
    src = pkgs.fetchgit {
      url = "https://github.com/mattn/emmet-vim";
      rev = "350f0ba10b9ee65837fc5b04a993b14a7a10e5ac";
      sha256 = "0439a3jd8v45nw6sl1gmhcz6w5ca5v2db0slahxg504zjs5jpivw";
    };
  };
  vim-discord = build {
    name = "vim-discord";
    src = pkgs.fetchgit {
      url = "https://github.com/aurieh/discord.nvim";
      rev = "b66a9874f91ec956680f9699de0f5a947cc211cf";
      sha256 = "0n1h5mlmzrrll26mz62v916jfifzr52a13z37w2g5svj1h5piyal";
    };
  };
  vim-ale = build {
    name = "vim-ale";
    src = pkgs.fetchgit {
      url = "https://github.com/w0rp/ale";
      rev = "c165c7c5d11eb827a3be6bab691f20eeb6f6e487";
      sha256 = "1bl55y0sk8m30ycd6ky4gr5mvqmbblipskazdccdl515ylnmln64";
    };
  };
  vim-tender = build {
    name = "vim-tender";
    src = pkgs.fetchgit {
      url = "https://github.com/jacoborus/tender.vim";
      rev = "6b0497a59233b3e67fb528a498069eb1d24743f9";
      sha256 = "1iqijk7xq0g6p3j8jgzgrhqizw87fnfryx73iaqqx5iyq1k8i9mn";
    };
  };
  vim-colors-lucid = build {
    name = "vim-colors-lucid";
    src = pkgs.fetchgit {
      url = "https://github.com/cseelus/vim-colors-lucid";
      rev = "a2bc8f68f7c408bb8525e5f0e2405931e5bf240c";
      sha256 = "08nhh8s02h5jv686n4vr7cgb28czpmiczsp8basn1457nvkwbins";
    };
  };
  spacevim = build {
    name = "spacevim";
    src = pkgs.fetchgit {
      url = "https://github.com/SpaceVim/SpaceVim";
      rev = "1c562abed1da5f07b3650104546eb46a75685efd";
      sha256 = "114x588svxgx8zx180walryyp4ysq88ya43605fximy2d3r8xzm4";
    };
  };
  vim-one = build {
    name = "vim-one";
    src = pkgs.fetchgit {
      url = "https://github.com/rakr/vim-one";
      rev = "f652d1cdf5d6ef68e759149b18e527d229b062e7";
      sha256 = "0p9zqvbivczcczqakjcylpy1sflygk4bdxybj8ijljyahjp7d0y3";
    };
  };
  vim-indentline = build {
    name = "vim-indentline";
    src = pkgs.fetchgit {
      url = "https://github.com/Yggdroot/indentLine";
      rev = "439348543c9ffe2c5c4469a6e8f005f67bf73cc1";
      sha256 = "13rld8pgarsnfqwfjh13p9hv92p9mf0jyjv6bbj4wlhr09rcyvh0";
    };
  };
}
