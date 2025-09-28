{ inputs, ... }:
{
  imports = [
    ./keymap.nix
    ./plugins
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}
