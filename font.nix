{ config, lib, pkgs, ... }:

{
  fonts = {
   packages = (with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
      ]
    );
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif =[
          "Noto Sans CJK JP"
          "Noto Clor Emoji"
        ];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
