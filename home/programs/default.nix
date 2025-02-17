{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    #    ./browsers/firefox.nix
    ./browsers/zen.nix
    ./catppuccin.nix
    ./media
    ./gtk.nix
    ./office
    ./qt.nix
  ];

  home.packages = with pkgs; [
    telegram-desktop
    micro
    intel-gpu-tools
    openssl
    glib-networking
    gnutls
    nautilus
    xfce.thunar

    vlc
    ani-cli
    youtube-music
    
    keepassxc

    gnome-calculator
    gnome-control-center
    cliphist

    overskride
    resources
    wineWowPackages.wayland
  ];
}
