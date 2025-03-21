# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  
  powerManagement.cpuFreqGovernor = "performance";

   nix = {
   settings = {
     auto-optimise-store = true; # Nix storeの最適化
     experimental-features = ["nix-command" "flakes"];
   };
   gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 7d";
   };
};

  # networking
  networking.networkmanager.enable = true;

  # time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };
  i18n.inputMethod = {
   enabled = "fcitx5";
   fcitx5.addons = [pkgs.fcitx5-mozc];
};
  fonts = {
     fonts = with pkgs; [
     noto-fonts-cjk-serif
     noto-fonts-cjk-sans
     noto-fonts-emoji
     nerdfonts
   ];
   fontDir.enable = true;
   fontconfig = {
     defaultFonts = {
       serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
       sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
       monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
       emoji = ["Noto Color Emoji"];
     };
   };
 };

  programs = {
  hyprland = {
   enable = true;
};
};
  # Configure keymap in X11
  services.xserver = {
   xkb = {
    layout = "us";
    variant = "";
};
enable =true;
displayManager ={
gdm.enable=true;
};
  };
services.displayManager={
defaultSession = "hyprland";
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nao = {
    isNormalUser = true;
    description = "nao";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  git
  gh
  firefox
  kitty
  thunderbird
  ];

 hardware.pulseaudio.enable = false; # pipewireに置き換える
 security.rtkit.enable = true; # pipewireに必要
 services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   jack.enable = true;
   pulse.enable = true;
 };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11"; # Did you read the comment?

}
