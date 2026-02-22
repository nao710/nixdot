{
  diagnostic.settings.virtual_text = true;

  plugins = {
    tiny-inline-diagnostic = {
      enable = true;
      settings = {
        multilines = {
          enabled = true;
        };
        options = {
          use_icons_from_diagnostic = true;
        };
      };
    };
    rustaceanvim = {
      enable = true;
      settings.tools.enable_clippy = true;
    };
    lspsaga = {
      enable = true;
      settings = {

        codeaction.enable = false;
      };
    };
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
        nixd = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };
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
