{inputs, config, pkgs, ... }:
{
  imports = [
     # inputs.quickshell.homeManagerModules.quickshell
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./fish
    ./niri
    ./fuzzel
     ./quickshell
  ];
    home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.swww.packages.${pkgs.system}.swww
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
