{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    shellAliases = {
      cdd = "cd ~";
      ls = "lsd";
      ".." = "cd ..";
      "..." = "cd ../..";
      ll = "lsd -la";
      g = "git";
      cp = "cp -i";
      rm = "rm -i";
      gl = "git pull";
      gps = "git push";
      gcm = "git commit -m";
      gs = "git status";
      ga = "git add";
      gcl = "gh repo clone";
      gc = "git commit";
      gd = "git diff";
    };
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
