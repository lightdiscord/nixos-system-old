{ config, pkgs, ... }:

{
  imports = [
    ../containers/gitea.nix
  ];
}
