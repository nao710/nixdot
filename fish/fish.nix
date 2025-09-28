{ pkgs, ... }:
{
  programs.fish = {
    shellAliases = {
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

    functions.cd = {
      body = ''
        if test (count $argv) -eq 0
            builtin cd ~
            set -l cd_status $status
        else if test (count $argv) -gt 1
            printf "%s\n" (_ "Too many args for cd command")
            return 1
        else
            if test "$argv" = "-"
                if test "$__fish_cd_direction" = "next"
                    nextd
                else
                    prevd
                end
                return $status
            end
            set -l previous $PWD
            builtin cd $argv
            set -l cd_status $status
        end

        if test $cd_status -eq 0 -a "$PWD" != "$previous"
            set -q dirprev[$MAX_DIR_HIST]
            and set -e dirprev[1]
            set -g dirprev $dirprev $previous
            set -e dirnext
            set -g __fish_cd_direction prev
        end

        if test $cd_status -ne 0
            return 1
        end

        ls
        return $status
      '';
    };
  };
}
