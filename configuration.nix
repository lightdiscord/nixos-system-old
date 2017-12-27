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
    ./containers
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

  fileSystems."/datas" = {
    device = "/dev/sda1";
    fsType = "ext4";
    label = "Datas";
    options = [ "nofail" ];
  };
}
