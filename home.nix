{inputs, pkgs, ... }:
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
    (pkgs.rust-bin.stable.latest.default.override {
      # extensions = [ "rust-src" "rust-analyzer" ];
      extensions = [ "rust-src" ];
    })
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";
}
