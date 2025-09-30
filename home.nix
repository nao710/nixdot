{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./fish
    ./niri
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
