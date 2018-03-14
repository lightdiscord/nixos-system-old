{ config, pkgs, ... }:

{
  imports = [
    ../features/i3wm.nix
    ../features/keyboard.nix
    ../features/video.nix
  ];
}
