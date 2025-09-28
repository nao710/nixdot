{
  plugins.lir = {
    enable = true;
    settings = {
      devicons = {
        enable = false;
      };
      hide_cursor = true;
      mappings = {
        "j" = {
          __raw = "require('lir').actions.up";
        };
        "<CR>" = {
          __raw = "require('lir').actions.edit";
        };
        "<ESC>" = {
          __raw = "require('lir').actions.quit";
        };
        "o" = {
          __raw = "require('lir').actions.cd";
        };
        "m" = {
          __raw = "require('lir').actions.mkdir";
        };
        "n" = {
          __raw = "require('lir').actions.newfile";
        };
        "R" = {
          __raw = "require('lir').actions.rename";
        };
        "D" = {
          __raw = "require('lir').actions.delete";
        };
      };
      show_hidden_files = true;
    };
  };
}
