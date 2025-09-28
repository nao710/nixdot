{ config, pkgs, ... }:
{
  imports = [
    ./nixvim.nix
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./fish
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
