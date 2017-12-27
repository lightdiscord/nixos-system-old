{ config, pkgs, ... }:

{
  services.xserver = {
    videoDrivers = [
      "modesetting"
      "nouveau"
    ];
    xrandrHeads = [
      "HDMI-1"
      { output = "DVI-I-1"; primary = true; }
    ];
  };
}
