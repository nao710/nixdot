{ config, pkgs, ... }:
{
  imports = [
    ./nixvim.nix
    ./git.nix
    ./nvim
    ./fish.nix
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
