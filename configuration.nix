{ config, pkgs, ... }:

with import ./accounts.nix;

{
  imports =
  [
    ./hardware-configuration.nix
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
    ];
  };

  services = {
    printing.enable = true;
    xserver = import ./services/xserver.nix { inherit (pkgs) i3-gaps; };
    mopidy = import ./services/mopidy.nix { inherit pkgs; };
    redshift = {
      enable = true;
      provider = "geoclue2";
    };
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

  containers = import ./containers.nix;
}
