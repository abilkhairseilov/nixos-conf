{ pkgs, ... }:

{

  services = {
    xserver = {
      enable = true;
      xkb.options = "ctrl:nocaps";
    };

    displayManager.ly.enable = true;
    geoclue2.enable = true;
  };

  environment.systemPackages = with pkgs; [

    polkit_gnome
    # editors
    tree-sitter

    easyeffects
    pavucontrol

    dbus

    ntfs3g
    usbutils

    wireguard-tools
    proton-vpn

    curlFull
    wget
    ripgrep
    fd
    tree
    jq
    btop
    zip
    unzip
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      # kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    kdeconnect = {
      enable = true;
    };
    vim = {
      enable = true;
      package = pkgs.vim-full;
    };
    neovim = {
      enable = true;
    };
    # steam = {
    # 	enable = true;
    # 	remotePlay.openFirewall = true;
    # };
  };

}
