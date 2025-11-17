{pkgs, ...}:{
    programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
  proton-ge-bin
];
  };
    xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk 
      xdg-desktop-portal-hyprland
    ];
  };
}
