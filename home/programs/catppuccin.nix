{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    accent = "pink";
    flavor = "mocha";
    waybar.enable  = false;
    gtk = {
      enable = false;
      size = "compact";
    };
    gtk.icon.enable = true;
    brave.enable = true;
    fzf.enable = false;
    hyprlock.enable = false;
    micro.enable = false;
    starship.enable = true;
    zed.enable = true;
    zsh-syntax-highlighting.enable = true;
    yazi.enable = false;
  };
}
