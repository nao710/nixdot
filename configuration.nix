{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./font.nix
    ./audio.nix
    ./other.nix
    ./hardware
    ./fish
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tokyo";

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
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };

  users.users.nao = {
    isNormalUser = true;
    description = "nao";
    extraGroups = [
      "networkmanager"
      "wheel"
      "waydroid"
    ];
  };

  environment.systemPackages = with pkgs; [
    gcc
    vim
    wget
    thunderbird
    alacritty
    gh
    wl-clipboard
    nerd-fonts.hack
    lsd
    bluez
    xwayland-satellite
    material-design-icons
    material-symbols
    fuzzel
    kdePackages.dolphin
    btop
    cava
    jq
    nnn
    unzip
    discord
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    kitty
    hyprcursor
    hypridle
    hyprpolkitagent
    waydroid-helper
    lutris
    nixd
    genymotion
    nixfmt
    lsd
    nodejs_24
    zsh
    zsh-powerlevel10k
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    rust-bin.stable.latest.default
  ];

  programs.firefox.enable = true;
  programs.niri.enable = true;
  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;
  # programs.fish.enable = true;
  users.defaultUserShell = pkgs.zsh;

  services.flatpak.enable = true;
  services.power-profiles-daemon.enable = true;

  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  security.polkit.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "nao" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  system.stateVersion = "25.05";

}
