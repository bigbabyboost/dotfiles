{self, config, pkgs, lib, ...}: {
  specialisation = {
  	lighto = {
  	  inheritParentConfig = true;
  	  configuration =  {
  	    stylix = {
          base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
          image = lib.mkForce config.theme.wallpaperLight;  		  
        };
      };
    };
  };
}
