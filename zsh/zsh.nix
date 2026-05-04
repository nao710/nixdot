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
      nvddiff = "sudo nixos-rebuild build --flake . && nvd diff  /run/current-system result/";
      nixbuild = "sudo nixos-rebuild switch --flake . #nixos";
      wmres = "hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1' &&  hyprctl --instance 0 'dispatch exec quickshell ipc call lockscreen lockScreen'";
    };
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
