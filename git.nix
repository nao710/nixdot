{
  programs.git = {
    enable = true;
    userName = "nao710";
    userEmail = "naototanaoto@outlook.com";

    extraConfig = {
      core.editor = "neovim";
      init.defaultBranch = "main";
      credential."https://github.com".helper = "!gh auth git-credential";
    };
  };
}
