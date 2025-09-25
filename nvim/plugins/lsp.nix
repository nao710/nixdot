{
  programs.nixvim = {
    diagnostic.settings.virtual_text = true;

    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;

        inlayHints = true;

        servers = {
          clangd.enable = true;
          cssls.enable = true;
          ts_ls.enable = true;
          lua_ls = {
            enable = true;
            settings.diagnostics.globals = [ "vim" ];
          };
        };
      };
    };
  };
}
