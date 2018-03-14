{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./udev.nix
    ./users.nix
    ../features/databases/mongodb.nix
  ];

  i18n = {
    consoleKeyMap = "fr";
    defaultLocale = "en_US.UTF-8";
  };
}
