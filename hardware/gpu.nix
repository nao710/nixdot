{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lact
  ];

  hardware.graphics = {
   enable = true;
   enable32Bit = true;
  };

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };
}
