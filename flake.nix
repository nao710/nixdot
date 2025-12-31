{
  description = "nixos config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
       url = "git+https://git.outfoxxed.me/quickshell/quickshell";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      quickshell,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit self inputs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          inputs.home-manager.nixosModules.default
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
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
