{ pkgs, config, inputs, lib, ... }: {
  imports = [inputs.stylix.homeManagerModules.stylix];
  # Stylix
  stylix = {
    enable = true;
    autoEnable = true;
    image = config.theme.wallpaperDark;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";    
    iconTheme = {
      enable = true;
      package = pkgs.colloid-icon-theme.override {
      	schemeVariants = ["gruvbox"];
      	colorVariants = ["green"];
      };
      dark = "Colloid-Green-Gruvbox-Dark";
      light = "Colloid-Green-Gruvbox";
    };
    fonts = {
      sizes.applications = lib.mkDefault 11;
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.ny;
        name = lib.mkDefault "New York";
      };
      sansSerif = {
        package = lib.mkDefault pkgs.adwaita-fonts;
        name = lib.mkDefault "Adwaita Sans";
      };
      monospace = {
        package = lib.mkDefault pkgs.adwaita-fonts;
        name = lib.mkDefault "Adwaita Mono";
      };
      emoji = {
        package = lib.mkDefault pkgs.noto-fonts-emoji;
        name = lib.mkDefault "Noto Color Emoji";
      };
    };
    cursor = {
      package = lib.mkDefault pkgs.bibata-cursors;
      name = lib.mkDefault "Bibata-Modern-Ice";
      size = lib.mkDefault 18;
    };
    targets = {
      gtk.enable =  true;
      gtk.flatpakSupport.enable = true;
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      hyprland.enable = false;
      hyprlock.enable = false;
      micro.enable = true;
      qt.enable = true;
      yazi.enable = true;
      zed.enable = false;
      waybar.enable = false;
      zathura.enable = false;
    };
  };
}
