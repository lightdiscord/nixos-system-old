{ pkgs }:

with import ./../accounts.nix;

{
  enable = true;
  extensionPackages = with pkgs; [
    mopidy-spotify 
    mopidy-mopify
    mopidy-gmusic
    mopidy-iris
    mopidy-moped
  ];
  configuration = ''
    [spotify]
    username = ${spotify.user}
    password = ${spotify.password}
    client_id = ${spotify.client_id}
    client_secret = ${spotify.client_secret}

    [gmusic]
    username = ${gmusic.user}
    password = ${gmusic.password}
    deviceid = ${gmusic.deviceid}
  '';
}
