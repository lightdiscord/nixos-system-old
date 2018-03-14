{ config, pkgs, ... }:

{
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
}
