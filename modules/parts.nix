{ self, inputs, ... }:

{
  flake.nixosConfigurations.bfg9k = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = [
      ../hosts/bfg9k

      # self.homeManagerModules.shell

      inputs.home-manager.nixosModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          users.zhori = import ../home/zhori;

          extraSpecialArgs = {
            inherit inputs;
          };
        };
      }
    ];
  };

  flake.homeConfigurations.zhori = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

    modules = [
      # inputs.codex-desktop-linux.homeManagerModules.default

      # {
      #   programs.codexDesktopLinux = {
      #     enable = true;
      #     linuxFeatures = [
      #       "read-aloud"
      #       "ui-tweaks"
      #     ];
      #   };
      # }

      # {
      #   programs.illogical-impulse.enable = true;
      # }
    ];
  };
}
