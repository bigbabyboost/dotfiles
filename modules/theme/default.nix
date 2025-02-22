{lib, ...}:
with lib; {
  options.theme = {

    name = lib.mkOption {
      type = lib.types.str;
      default = dark;
    };
    
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
