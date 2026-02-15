{ pkgs, ... }:
{
  programs.fish = {
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
    };
    interactiveShellInit = ''
      function auto_ls --on-variable PWD
          status --is-interactive; and ls
      end
    '';
  };
}
