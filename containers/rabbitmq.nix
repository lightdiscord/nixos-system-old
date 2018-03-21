{ config, pkgs, ... }:

{
  networking.hosts."127.0.0.3" = [ "rabbitmq.local" ];
  containers.rabbitmq = {
    autoStart = false;
    privateNetwork = false;
    localAddress = "127.0.0.3";
    hostAddress = "127.0.0.1";

    #bindMounts = {
    #  "/gitea" = {
    #    hostPath = "/datas/gitea";
    #    isReadOnly = false;
    #    mountPoint = "/gitea";
    #  };
    #};

    config = { config, pkgs, ... }:
    {
      networking.firewall.allowedTCPPorts = [ 15672 5672 ];
      services.rabbitmq = {
        enable = true;
        listenAddress = "127.0.0.3";
      };
    };
  };
}
