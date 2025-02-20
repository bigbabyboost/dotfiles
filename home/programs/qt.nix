{
  lib,
  pkgs,
  config,
  ...
}: let
  variant = "mocha";
  accent = "pink";
  kvantumThemePackage = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };
  kvantum = {
    Appearance = {
      custom_palette = false;
      icon_theme = config.stylix.iconTheme.dark;
      standard_dialogs = "xdgdesktopportal";
      style = "kvantum";
    };
  };

  defaultFont = "${config.stylix.fonts.sansSerif.name},${builtins.toString config.stylix.fonts.sizes.applications}";
in {
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = [
    pkgs.qt6Packages.qtstyleplugin-kvantum
    pkgs.qt6Packages.qt6ct
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
  ];

  xdg.configFile = {
    # Kvantum config
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';
    "Kvantum/catppuccin-${variant}-${accent}".source = "${kvantumThemePackage}/share/Kvantum/catppuccin-${variant}-${accent}"; 

    # qtct config
    "qt5ct/qt5ct.conf".text = let
      default = ''"${defaultFont},-1,5,50,0,0,0,0,0"'';
    in
      lib.generators.toINI {} (
        kvantum
        // {
          Fonts = {
            fixed = default;
            general = default;
          };
        }
      );

    "qt6ct/qt6ct.conf".text = let
      default = ''"${defaultFont},-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"'';
    in
      lib.generators.toINI {} (
        kvantum
        // {
          Fonts = {
            fixed = default;
            general = default;
          };
        }
      );
  };
}
