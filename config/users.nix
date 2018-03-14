{ config, pkgs, ... }:

let
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  neovim = pkgs.neovim.override { configure = (import ../features/neovim { inherit pkgs; }); };
  python3 = pkgs.python36.withPackages (ps: [ ps.numpy ps.editorconfig ]);
  python2 = pkgs.python27.withPackages (ps: [ ps.numpy ps.editorconfig ]);
in {
  imports = [
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/nixos-module.tar.gz}/nixos"
  ];

  users.extraUsers = {
    arnaud = {
      uid = 1000;
      description = "Arnaud Pascal";
      home = "/home/arnaud";
      createHome = true;
      shell = pkgs.fish;
      group = "users";
      extraGroups = [ "wheel" "audio" "networkmanager" ];
      packages = with pkgs; ([
        neovim
        htop
        tmux
        git
        gitAndTools.gitflow
        sshpass
        fortune
        wget
        tldr
        rustup
        nodejs-9_x
        gcc
        python3
        python2
        gnumake
        unzip
        unrar
        editorconfig-core-c
        tree
        emacs
      ] ++ pkgs.lib.optionals config.services.xserver.enable [
        discord
        tdesktop
        polybar
        rofi
        i3lock
        vlc
        alacritty
        #gitkraken
        pavucontrol
        compton
        lxappearance
        psmisc
        ffmpeg
        #gst-ffmpeg
        #hal-flash
        #openh264
        #x264
        #firefox-devedition-bin
        chromium
        tor
        torsocks
        tor-arm
        tor-browser-bundle-bin
        gimp
        inkscape
        #steam
        feh
        spotify
        robomongo
        vscode
      ]);
    };
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

    #programs.home-manager = {
    #  enable = true;
    #  path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
    #};

    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 3600;
      enableSshSupport = true;
    };

    systemd.user.services.emacsd = {
      Unit = {
        Description = "Emacs: the extensible, self-documenting text editor";
      };

      Service = {
        Type = "forking";
        ExecStart = "${pkgs.emacs}/bin/emacs --daemon";
        ExecReload = "${pkgs.emacs}/bin/emacsclient --eval \"(kill-emacs)\"";
        Environment = ''
          PATH=${pkgs.xclip}/bin:${pkgs.coreutils}/bin
        '';
        Restart = "always";
      };

      Install = {
        WantedBy = ["default.target"];
      };
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
      ec = "emacsclient -t";
      ecw = "emacsclient -c -a emacs";
    };
  };
}
