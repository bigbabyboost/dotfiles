{lib, ...}:
with lib; {
  options.theme = {
    wallpaperDark = mkOption {
      type = types.path;
      description = ''
        Wallpaper image.
      '';
      default = "";
    };
    wallpaperLight = mkOption {
      type = types.path;
      description = ''
        Wallpaper image.
      '';
      default = "";
    };    
  };
}
