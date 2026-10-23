{
  description = "bfg9k NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		codex-desktop-linux = {
			url = "github:ilysenko/codex-desktop-linux";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { self, nixpkgs, home-manager, quickshell, codex-desktop-linux, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.bfg9k = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        inherit system;
        modules = [
          ./hosts/bfg9k
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zhori = import ./home/zhori;

            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
			homeConfigurations.zhori = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        codex-desktop-linux.homeManagerModules.default
        {
          programs.codexDesktopLinux = {
            enable = true;
            linuxFeatures = [ "read-aloud" "ui-tweaks" ];
          };
        }
      ];
    };
    };
}
