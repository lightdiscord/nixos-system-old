{ config, pkgs, ... }:

{
  services.xserver.layout = "fr";
  services.xserver.libinput.enable = true;
}
