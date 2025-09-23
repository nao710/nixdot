{
 description = "nixos config";
 inputs = {
  nixpkgs.url = "nixpkgs/nixos-25.05";
  home-manager = {
   url = "github:nix-community/home-manager/release-25.05";
   inputs.nixpkgs.follows = "nixpkgs";
  };
    nixvim = {
    url = "github:nix-community/nixvim/nixos-25.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };
 };
 outputs = { self, nixpkgs, home-manager, nixvim, ...}@inputs:{
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
   system = "x86_64-linux";
   modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager{
    home-manager = {
    sharedModules = [
     nixvim.homeManagerModules.nixvim
    ];
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

