{ pkgs, ... }:

{
 programs.nixvim= {
 enable = true;
  plugins = {
  lightline.enable = true;
    lsp = {
      enable = true;
      servers.nil_ls.enable = true;
    };

    lsp-format = {
      enable = true;
    };
  };
  extraConfigLua = ''
    require("lspconfig").nil_ls.setup {
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixfmt" },
          },
        },
      },
    }
  '';

  extraPackages = with pkgs; [
    nixfmt-rfc-style
  ];
};
}
