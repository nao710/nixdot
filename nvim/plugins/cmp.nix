{ lib, ... }:
{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental.ghost_text = true;

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "path";
            priority = 500;
          }
          {
            name = "buffer";
            priority = 250;
          }
          {
            name = "copilot";
            priority = 100;
          }
          { name = "nvim_lua"; }
        ];

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];

          format = lib.mkForce ''
            function(entry, vim_item)
              local kind = require("lspkind").cmp_format({
                mode = "symbol",  
                maxwidth = 25,
                ellipsis_char = "...",
              })(entry, vim_item)

             local icon, hl, _ = require("mini.icons").get("lsp", kind.kind)
              if icon then
                kind.kind = icon
                kind.kind_hl_group = hl
              end
              
              return kind
            end
          '';
        };

        window =
          let
            windowConfig = {
              border = "rounded";
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
              scrollbar = false;
              sidePadding = 0;
            };
          in
          {
            completion = windowConfig;
            documentation = windowConfig;
          };
      };

      cmdline = {
        "/" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            { name = "path"; }
            { name = "cmdline"; }
          ];
        };
      };
    };

    luasnip.enable = true;
    lspkind = {
      enable = true;
      cmp.enable = false;
    };

    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-cmdline.enable = true;
    cmp_luasnip.enable = true;
  };
}
