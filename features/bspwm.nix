{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
    };

    displayManager.lightdm = {
      enable = true;
    };
  };
}
