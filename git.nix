{
  programs.git = {
    enable = true;

    settings = {
      user.email = "naototanaoto@outlook.com";
      user.name = "nao710";
      core.editor = "neovim";
      init.defaultBranch = "main";
      credential."https://github.com".helper = "!gh auth git-credential";
    };
  };
}
