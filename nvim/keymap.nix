{
  programs.nixvim = {
    enable = true;

    keymaps = [
      {
        mode = "i";
        key = "<Up>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "i";
        key = "<Down>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "i";
        key = "<Left>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "i";
        key = "<Right>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Up>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Down>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Left>";
        action = "<Nop>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<Right>";
        action = "<Nop>";
        options.silent = true;
      }

      {
        mode = "n";
        key = "<CR>";
        action = "A<Return><Esc>^k";
      }
      {
        mode = "i";
        key = "jj";
        action = "<Esc>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "+";
        action = "<C-a>";
      }
      {
        mode = "n";
        key = "-";
        action = "<C-x>";
      }
      {
        mode = "n";
        key = "<C-a>";
        action = "gg<S-v>G";
      }

      # Split window
      {
        mode = "n";
        key = "ss";
        action = ":split<Return><C-w>w";
      }
      {
        mode = "n";
        key = "sv";
        action = ":vsplit<Return><C-w>w";
      }

      # Move window
      {
        mode = "n";
        key = "<Space>";
        action = "<C-w>w";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "sh";
        action = "<C-w>h";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "sk";
        action = "<C-w>k";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "sj";
        action = "<C-w>j";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "sl";
        action = "<C-w>l";
      }

      # Resize window
      {
        mode = "n";
        key = "<C-w><left>";
        action = "<C-w><";
      }
      {
        mode = "n";
        key = "<C-w><right>";
        action = "<C-w>>";
      }
      {
        mode = "n";
        key = "<C-w><up>";
        action = "<C-w>+";
      }
      {
        mode = "n";
        key = "<C-w><down>";
        action = "<C-w>-";
      }


      # Tab edit
      {
        mode = "n";
        key = "<Tab>";
        action = ":tabNext<CR>";
      }

      {
        mode = "n";
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = ":";
        action = ";";
      }
      {
        mode = "v";
        key = ":";
        action = ";";
      }

      {
        mode = "n";
        key = "mc";
        action = "<cmd>RustLsp expandMacro<CR>";
      }

      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<CR>";
      }
      {
        mode = "n";
        key = "ca";
        action = "<cmd>Lspsaga code_action<CR>";
      }
      {
        mode = "n";
        key = "rn";
        action = "<cmd>Lspsaga rename<CR>";
      }
      {
        mode = "n";
        key = "er";
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      }
    ];

    # plugins = {
    #   # NnnPicker (nnn.nvimなど)
    #   nnn-nvim.enable = true;
    #
    #   # Floaterm (floaterm.nvimなど)
    #   floaterm.enable = true;
    #
    #   # LSPaga (lspsaga.nvim)
    #   lspsaga.enable = true;
    # };
  };
}
