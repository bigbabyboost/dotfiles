{self, config, pkgs, lib, ...}: {
  theme = {
    wallpaperDark = "${self}/home/wallpapers/gruvbox-dark-long.png";
    wallpaperLight = "${self}/home/wallpapers/gruvbox-light-long.png";
  };
  specialisation = {
  	lighto = {
  	  configuration =  {
  	    stylix = {
          base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
          image = lib.mkForce config.theme.wallpaperLight;  		  
        };
        services.hyprpaper = {
          settings = {
            preload = lib.mkForce ["${config.theme.wallpaperLight}"];
            wallpaper = lib.mkForce [", ${config.theme.wallpaperLight}"];
          };
        };
        programs.hyprlock = {
          settings = {
            background = [
              {
          	    monitor = "";
          	    path = lib.mkForce config.theme.wallpaperLight;
          		blur_passes = 3;
          		blur_size = 10;
          		brightness = 0.8;
          	  }
            ];
          };
        };
      };
    };
  };
}
