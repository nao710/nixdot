{
  description = "nixos config";
  inputs ={
   nixpkgs.url = "nixpkgs/nixos-25.05";
   firefox-addons = {
    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    inputs.nixpkgs.follows = "nixpkgs";
    };
   home-manager ={
    url = "github:nix-community/home-manager/release-25.05";
    inputs.nixpkgs.follows = "nixpkgs";
 };
 niri = {
  url = "github:sodiboo/niri-flake";
  inputs.nixpkgs.follows = "nixpkgs";
  };
};
 outputs ={self, nixpkgs, home-manager, ...}:{
   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linxu";
    modules = [
     ./configuration.nix
     home-manager.nixosModules.home-manager{
     home-manager ={
      useGlobalPkgs = true;
      useUserPackages = true;
      users.nao = import ./home.nix;
      backupFileExtension = "backup";
};
}
];
};
};
}
