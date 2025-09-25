{ inputs, ... }:
{
imports = [
 ./keymap.nix
 ./plugins.nix
];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}
