{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    uv

    tinymist
    nixd
    nixfmt
    lua-language-server

    # docs
    typst
    pandoc

  ];

  programs = {
    git.enable = true;

    # booooooo
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
        openssl
        libffi
        glibc
      ];
    };
  };
}
