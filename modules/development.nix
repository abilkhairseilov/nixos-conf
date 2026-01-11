{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    javaPackages.compiler.temurin-bin.jre-17
    git
		gh
		curl
		wget
		ripgrep
		fd
		tree
		jq
		btop

    typst
    texliveFull
  ];
}
