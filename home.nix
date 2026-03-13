{ inputs, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./alacritty.nix
    ./nvim
    ./niri
    ./fuzzel
    ./quickshell
    ./hyprland
    inputs.zen-browser.homeModules.twilight
  ];
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.awww.packages.${pkgs.system}.awww
    (pkgs.rust-bin.stable.latest.default.override {
      # extensions = [ "rust-src" "rust-analyzer" ];
      extensions = [ "rust-src" ];
    })
  ];
  home.username = "nao";
  home.homeDirectory = "/home/nao";
  home.stateVersion = "25.05";

  programs.zen-browser.enable = true;
  programs.zen-browser.policies = {
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    DisableFeedbackCommands = true;
    DisablePocket = true;
    DontCheckDefaultBrowser = true;
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
  };
}
