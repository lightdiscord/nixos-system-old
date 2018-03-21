{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    <nixpkgs/nixos/modules/virtualisation/amazon-image.nix>

    ../cfg/base.nix
  ];

  ec2.hvm = true;

  networking = {
    hostName = "Light-EC2";
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
    nix-prefetch-git
  ];
}
