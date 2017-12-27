{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";
    videoDrivers = [
      "modesetting"
      "nouveau"
    ];
    xrandrHeads = [
      "HDMI-1"
      { output = "DVI-I-1"; primary = true; }
    ];
    libinput.enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
