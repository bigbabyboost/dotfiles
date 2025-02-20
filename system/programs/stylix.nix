{ pkgs, config, inputs, lib, ... }: {
  imports = [inputs.stylix.nixosModules.stylix];
  # Stylix
  stylix = {
    enable = true;
    autoEnable = true;
    image = config.theme.wallpaperDark;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";
    homeManagerIntegration.autoImport = false;
    homeManagerIntegration.followSystem = true;
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
      console.enable = true;
      gtk.enable = lib.mkDefault true;
      nixos-icons.enable = true;
      qt.enable = true;
    };
  };
}
