{ pkgs, ... }:
{

  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#181825"; # Example: Gruvbox dark hard contrast background
        };
      };
      font = {
        size = 12;
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
        opacity = 0.721;
        blur = true;
        dimensions = {
          columns = 200;
          lines = 40;
        };
      };
    };
  };
}
