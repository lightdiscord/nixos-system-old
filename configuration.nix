{ config, pkgs, ... }:

with import ./accounts.nix;

{
  imports =
  [
    ./hardware-configuration.nix
    ./services/xserver.nix
    ./services/udev.nix
    ./services/printing.nix
    ./services/redshift.nix
    # ./services/mopidy.nix
  ];

  system = {
    stateVersion = "17.09";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    hostName = "LightDiscord";
    extraHosts = ''
      127.0.0.2 gitea.local
    '';
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "fr";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Paris";

  environment.systemPackages = with pkgs; [
    neovim
    fish
    gnupg
    opensc
    libu2f-host
    yubikey-personalization
    xorg.xf86inputlibinput
  ];

  environment.variables.DISPLAY = ":0";

  fonts = {
    enableDefaultFonts = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      dejavu_fonts
      font-awesome-ttf
      emojione
      opensans-ttf
      material-icons
      nerdfonts
      powerline-fonts
      fira-code
    ];
  };

  hardware = {
    bluetooth.enable = false;
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };

  fileSystems."/datas" = {
    device = "/dev/sda1";
    fsType = "ext4";
    label = "Datas";
    options = [ "nofail" ];
  };

  users.extraUsers.arnaud = import ./users/arnaud.nix { inherit (pkgs) fish; };

  programs.fish.enable = true;

  security.pam.enableU2F = true;

  containers = import ./containers.nix;
}
