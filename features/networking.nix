{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.2 gitea.local
    '';
  };
}
