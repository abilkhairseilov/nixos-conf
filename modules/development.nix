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
    zip
    unzip

    gcc
    nodejs_24
    svelte-language-server
    llvmPackages_20.clang-unwrapped

    typst
    tinymist
    texliveFull
    pandoc
  ];
}
