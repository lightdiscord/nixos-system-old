{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>

    ../hardware-configuration.nix

    ../cfg/base.nix
    ../cfg/desktop-i3wm.nix

    ../containers/rabbitmq.nix
  ];

  services.xserver = {
    videoDrivers = [
      "modesetting"
      "nvidia"
    ];
    xrandrHeads = [
      { output = "HDMI-0"; primary = true; }
      "DVI-I-0"
    ];
  };

  environment.variables.DISPLAY = ":0";

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Iosevka Term" "DejaVu Sans Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
    allowBitmaps = false;
    allowType1 = false;
    includeUserConf = false;
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    font-awesome-ttf
    emojione
    opensans-ttf
    material-icons
    nerdfonts
    powerline-fonts
    fira-code
    iosevka
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  networking = {
    hostName = "Light";
    networkmanager.protonvpn = {
      enable = true;
      country = "fr";
      credentials = "/etc/keys/protonvpn.txt";
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    fish
    gnupg
    opensc
    pcsctools
    libu2f-host
    yubikey-personalization
    xorg.xf86inputlibinput
    nix-prefetch-git
  ];

  hardware = {
    bluetooth.enable = false;
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  services.redshift = {
    enable = true;
    provider = "geoclue2";
  };

  services.printing.enable = true;
}
