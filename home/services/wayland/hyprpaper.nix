{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${config.theme.wallpaperDark}"];
      wallpaper = [", ${config.theme.wallpaperDark}"];
    };
  };

  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
