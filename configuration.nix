{ config, pkgs, ... }:

with import ./accounts.nix;

{
  imports =
  [
    ./hardware-configuration.nix

    ./config
    ./services/printing.nix
    ./services/redshift.nix
    # ./services/mopidy.nix
    ./features/desktop.nix
    ./features/networking.nix
    ./features/drive-datas.nix
    #./containers
  ];

  system = {
    stateVersion = "17.09";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "LightDiscord";

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

  hardware = {
    bluetooth.enable = false;
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };
}
