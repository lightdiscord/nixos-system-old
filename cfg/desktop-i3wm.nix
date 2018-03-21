{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.sddm.enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
