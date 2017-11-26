{
  "gitea" = (import ./containers-configuration/gitea.nix) // { autoStart = true; };
}
