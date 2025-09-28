{ pkgs, ... }:
{

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 14;
        bold = {
          family = "hack Nerd Font";
          style = "Bold";
        };
        normal = {
          family = "hack Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "hack Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "hack Nerd Font";
          style = "Bold Italic";
        };
      };
      cursor = {
        style = {
          shape = "Block";
        };
      };
      window = {
        opacity = 0.763;
        dimensions = {
          columns = 200;
          lines = 40;
        };
      };
    };
  };
}
