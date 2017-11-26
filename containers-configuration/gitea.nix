{
  privateNetwork = false;
  localAddress = "127.0.0.2";
  hostAddress = "127.0.0.1";

  bindMounts = {
    "/gitea" = {
      hostPath = "/datas/gitea";
      isReadOnly = false;
      mountPoint = "/gitea";
    };
  };

  config = { config, pkgs, ... }:
  {
    services.gitea = {
      enable = true;
      user = "root";
      stateDir = "/gitea";
      domain = "gitea.local";
      rootUrl = "http://gitea.local";
      httpAddress = "127.0.0.2";
      httpPort = 80;
    };
  };
}
