{inputs, config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./fish
    ./niri
    ./fuzzel
    # ./quickshell
    ./hyprland
  ];
    home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.awww.packages.${pkgs.system}.awww
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
