{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

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
    pnpm_9
    svelte-language-server
    llvmPackages_20.clang-unwrapped
    python315
    rustc
    javaPackages.compiler.temurin-bin.jre-17
    eclipses.eclipse-java
    vscode
    zlib

    sqlite

    typst
    tinymist
    texliveFull
    pandoc

  ];
}
