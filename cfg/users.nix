{ config, pkgs, ... }:

let 
  neovim = pkgs.neovim.override { configure = (import ./neovim { inherit pkgs; }); };
in {

  imports = [
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/nixos-module-user-pkgs.tar.gz}/nixos"
  ];

  users.extraUsers.arnaud = {
    description = "LightDiscord";
    uid = 1000;
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "git"
    ];
    isNormalUser = true;
    createHome = false;
    shell = pkgs.fish;
    packages = with pkgs; ([
      # Terminal
      neovim
      htop
      tmux
      fortune
      wget
      tldr
      tree
      unzip
      unrar

      # Tools
      editorconfig-core-c

      # Git
      git
      gitAndTools.gitflow
      sshpass

      # Languages
      rustup
      nodejs-9_x
      gcc
      python3
      python2
      gnumake

      # Social
      irssi
    ] ++ pkgs.lib.optionals config.services.xserver.enable [
      # Social
      discord

      # Window manager
      rofi
      i3lock
      alacritty

      # Browser
      chromium
      tor
      torsocks
      tor-arm
      tor-browser-bundle-bin

      # Media
      gimp
      inkscape
      feh
      spotify
      vlc
      pavucontrol
      imagemagick

      # Tools
      robomongo
      vscode
      ffmpeg
    ]);
  };

  home-manager.users.arnaud = {
    programs.git = {
      enable = true;
      userName = "LightDiscord";
      userEmail = "arnaud@lightdiscord.me";
      signing = {
        key = "228771BEE8E0679EC97EE4DB423E280DABD7C87E";
        signByDefault = true;
      };
      aliases = {
        "ls" = "log --graph --abbrev-commit --all --format=format:'%C(bold green)%h%C(reset) - %C(bold white)(%ar)%C(reset) %C(white)%s -%C(bold white) %an%C(reset)'";
      };
      extraConfig = ''
        [core]
        editor=nvim
      '';
    };

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 3600;
      enableSshSupport = true;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.arc-theme;
        name = "Arc-Dark";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
  };
}
