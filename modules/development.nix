{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    git
		gh
		curlFull
		wget
		ripgrep
		fd
		tree
		jq
		btop
    zip
    unzip

    # editors
    neovim
    yazi
		tree-sitter


    gcc
    uv
  
		# lsps
    tinymist
    nixd
    lua-language-server
    
    typst
    pandoc

  ];

  # booooooo
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      libffi
      glibc
    ];
  };
}
