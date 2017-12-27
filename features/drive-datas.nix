{ config, ... }:

{
  fileSystems."/datas" = {
    device = "/dev/sda1";
    fsType = "ext4";
    label = "Datas";
    options = [ "nofail" ];
  };
}
