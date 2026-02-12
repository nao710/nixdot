{
  diagnostic.settings.virtual_text = true;

  plugins = {
    rustaceanvim = {
      enable = true;
      settings.tools.enable_clippy = true;
    };
    lspsaga.enable = true;
    none-ls.enable = true;
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        # rust_analyzer = {
        #   enable = true;
        #   installCargo = true;
        #   installRustc = true;
        # };
        nixd.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        ts_ls.enable = true;
        qmlls.enable = true;
        lua_ls = {
          enable = true;
          settings.diagnostics.globals = [ "vim" ];
        };
      };
    };
  };
}
