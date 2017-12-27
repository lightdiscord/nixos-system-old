{ config, pkgs, ... }:

{
  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Iosevka Term" "DejaVu Sans Mono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
    allowBitmaps = false;
    allowType1 = false;
    includeUserConf = false;
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    font-awesome-ttf
    emojione
    opensans-ttf
    material-icons
    nerdfonts
    powerline-fonts
    fira-code
    iosevka
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
