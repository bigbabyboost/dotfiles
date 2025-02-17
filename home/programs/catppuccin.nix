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
    waybar.enable  = true;
    gtk = {
      enable = true;
      size = "compact";
    };
    gtk.icon.enable = true;
    brave.enable = true;
    fzf.enable = true;
    hyprlock.enable = true;
    micro.enable = true;
    starship.enable = true;
    zed.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
}
