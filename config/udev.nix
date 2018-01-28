{ config, pkgs, ... }:

{
  services.udev = {
    packages = with pkgs; [
      libu2f-host
      yubikey-personalization
      libinput
    ];
  };
  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services.xserver.libinput.enable = true;

  security.pam.enableU2F = true;
}
