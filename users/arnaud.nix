{ fish }:

{
  isNormalUser = true;
  home = "/home/arnaud";
  group = "users";
  extraGroups = [
    "wheel"
    "audio"
    "networkmanager"
  ];
  shell = fish;
}
