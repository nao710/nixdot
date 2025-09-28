{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    home.file.".config/niri" = {
      recursive = true;
      source = ./niri;
    };
  };
}
