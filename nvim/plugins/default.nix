{
  programs.nixvim = {
    imports = [
      ./lsp.nix
      ./cmp.nix
      ./tree.nix
      ./treesitter.nix
      ./luasnip.nix
      ./lualine.nix
      ./theme.nix
    ];
    plugins = {
      autoclose.enable = true;
      fidget = {
        enable = true;
        settings.window = {
          winblend = 0;
        };
      };
    };
  };
}
