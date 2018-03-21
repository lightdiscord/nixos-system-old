{ config, lib, pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix
  
    ../options/protonvpn/protonvpn-nm.nix

    ./users.nix
  ];

  system = {
    stateVersion = "17.09";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };

  i18n = {
    consoleKeyMap = "fr";
    defaultLocale = "en_US.UTF-8";
  };

  services.udev = {
    packages = with pkgs; [
      libu2f-host
      yubikey-personalization
      libinput
    ];
  };
  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services.xserver.libinput.enable = true;

  security.pam.enableU2F = true;

  #boot.loader.grub = {
  #  enable = true;
  #  version = 2;
  #};

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
  };

  nix = {
    useSandbox = true;
    buildCores = 0;
    trustedUsers = [ "root" "@wheel" ];

    extraOptions = ''
      gc-keep-outputs = true
      log-servers = http://hydra.nixos.org/log
      connect-timeout = 15
    '';

    gc = {
      automatic = true;
      dates = "00:00";
      options = "--delete-older-than 14d";
    };
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  nixpkgs.config = import ./nixpkgs-config.nix;

  time.timeZone = "Europe/Paris";
}
