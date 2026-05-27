{
  description = "T3 Code GUI for NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.appimageTools.wrapType2 rec {
        pname = "t3code";
        version = "0.0.20"; 
        src = pkgs.fetchurl {
          url = "https://github.com/pingdotgg/t3code/releases/download/v${version}/T3-Code-${version}-x86_64.AppImage";
          sha256 = "82562717c500e6ce2bae9509baf9381e542dc8c8a46dc90892630886726e80ee"; 
        };

        extraPkgs = pkgs: with pkgs; [ libsecret util-linux ];
      };
    };
}
