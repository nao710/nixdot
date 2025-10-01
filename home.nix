{inputs, config, pkgs, ... }:
{
  imports = [
     # inputs.quickshell.homeManagerModules.quickshell
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./fish
    ./niri
    # ./quickshell
  ];
    home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
