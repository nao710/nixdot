{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lact
  ];

  environment.variables = {
   ROC_ENABLE_PRE_VEGA = "1";
   MOZ_ENABLE_WAYLAND= "1";
 };


    hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-tools
      mesa
    ];
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
