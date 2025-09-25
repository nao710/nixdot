{ inputs, ... }:
{
imports = [
 ./keymap.nix
 ./plugins
];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}
