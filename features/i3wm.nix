{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    displayManager.lightdm = {
      enable = true;
    };
  };
}
