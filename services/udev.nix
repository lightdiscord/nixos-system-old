{ pkgs, ... }:

{
  services.udev.packages = with pkgs; [
    libu2f-host
    yubikey-personalization
    libinput
  ];
}
