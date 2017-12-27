{ config, pkgs, ... }:

{
  users.extraUsers = {
    arnaud = {
      uid = 1000;
      description = "Arnaud Pascal";
      home = "/home/arnaud";
      createHome = true;
      shell = pkgs.fish;
      group = "users";
      extraGroups = [ "wheel" "audio" "networkmanager" ];
    };
  };

  programs.fish.enable = true;
}
