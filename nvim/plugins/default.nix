{
 programs.nixvim = {
 imports = [
  ./lsp.nix
  ./cmp.nix
  ./tree.nix
  ./treesitter.nix
 ];
};
}
