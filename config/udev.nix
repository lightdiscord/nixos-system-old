{ config, pkgs, ... }:

{
  services.udev = {
    packages = with pkgs; [
      libu2f-host
      yubikey-personalization
      libinput
    ];
  };

  services.xserver.libinput.enable = true;

  security.pam.enableU2F = true;
}
