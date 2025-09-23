{ config, pkgs, ...}:{
 imports = [ 
  ./nixvim.nix
  ./git.nix
 ];
 home.username = "nao";
 home.homeDirectory = "/home/nao";
 home.stateVersion = "25.05";
}
