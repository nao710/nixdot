{
  plugins = {
    luasnip.enable = true;

    cmp-buffer = {
      enable = true;
    };

    cmp-nvim-lsp = {
      enable = true;
    };

    cmp-path = {
      enable = true;
    };
    cmp-cmdline = {
      enable = true;
    };

    cmp_luasnip = {
      enable = true;
    };

    cmp = {
      enable = true;

      settings = {
        experimental = {
          ghost_text = true;
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "nvim_lua"; }
          { name = "path"; }
          { name = "copilot"; }
        ];

        formatting = {
          fields = [
            "abbr"
            "kind"
            "menu"
          ];
          # format =
          #   # lua
          #   ''
          #                    function(entry, vim_item)
          #     		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
          #     			vim_item)
          #     		local strings = vim.split(kind.kind, "%s", { trimempty = true })
          #     		kind.kind = " " .. (strings[1] or "") .. " "
          #     		kind.menu = "    (" .. (strings[2] or "") .. ")"
          #
          #     		return kind
          #                   	end,
          #   '';
        };

        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
            scrollbar = false;
            sidePadding = 0;
            border = "rounded";
          };
        };

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Insert,
		})";
        };
        cmdline = {
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              { name = "path"; }
              { name = "cmdline"; }
            ];
          };
        };
      };
    };
  };
}
