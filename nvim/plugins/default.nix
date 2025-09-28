{
  programs.nixvim = {
    imports = [
      ./lsp.nix
      ./cmp.nix
      ./tree.nix
      ./treesitter.nix
      ./luasnip.nix
			./lualine.nix
    ];
    plugins = {
      autoclose.enable = true;
    };
  };
}
