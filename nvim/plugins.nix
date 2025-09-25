{
  programs.nixvim = {

    colorschemes.catppuccin.enable = true;
    colorschemes.everforest.settings = {
      transparent_background_level = 1;
    };
    plugins = {

      colorizer.enable = true;

      # lsp.enable = true;
      # lsp-colors.enable = true;

      cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
      cmp-cmdline.enable = true;
      lspkind.enable = true;

      luasnip.enable = true;
      friendly-snippets.enable = true;

      treesitter.enable = true;
      treesitter-configs = {
        settings = {
          ensure_installed = [ "lua" "vim" "html" "css" ];
          indent.enable = true;
        };
      };

      nvim-web-devicons.enable = true;

      gitsigns.enable = true;

      # mason = {
      #   enable = true;
      #   ensureInstalled = [
      #     "lua-language-server"
      #     "stylua"
      #   ];
      # };
      # mason-lspconfig.enable = true;

      autopairs.enable = true;

      prettier.enable = true;

      navic.enable = true;

      mini.enable = true;

      none-ls.enable = true;

      nnn.enable = true;

      lualine.enable = true;

      automkdir.enable = true;

      todo-comments = {
        enable = true;
        settings.signs = {
          TODO = { icon = "   "; color = "info"; };
        };
      };

      floaterm.enable = true;

      lsp = {
        inlayHints.enable = true;
      };

      # neodev.nvim
      neodev.enable = true;

      # hlargs.nvim
      hlargs.enable = true;

      # fidget.nvim
      fidget.enable = true;

      # lspsaga.nvim
      lspsaga = {
        enable = true;
        settings = {
          border_style = "single";
          ui = {
            lines = [ "┗" "┣" "┃" "━" "┏" ];
            code_action = " ";
          };
        };
      };

      nvim-ts-autotag.enable = true;

      tiny-inline-diagnostic.enable = true;

      rustaceanvim = {
        enable = true;
        default_settings = {
          rust-analyzer = {
            check = {
              command = "clippy";
            };
            checkOnSave = {
              command = "clippy";
            };
            rustc = {
              source = "discover";
            };
            cargo = {
              allFeatures = true;
            };
          };
        };
      };

      # crates.nvim
      crates.enable = true;

    };

    extraConfigLua = ''
      -- tiny-inline-diagnostic.nvimの設定
      require("tiny-inline-diagnostic").setup({
        preset = "minimal",
        options = {
          show_source = true,
        },
      })
      vim.diagnostic.config({ virtual_text = false })

    '';
  };
}

