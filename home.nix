{ config, pkgs, ...}:
{
 imports = [./nvim.nix];
 home.username = "nao";
 home.homeDirectory = "/home/nao";
 home.stateVersion = "25.05";
programs.bash = {
enable = true;
shellAliases ={
 hellonix = "echo hello nix!";
};
};
 
}
