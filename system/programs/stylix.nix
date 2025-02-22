{ pkgs, config, inputs, lib, ... }: {
  imports = [inputs.stylix.nixosModules.stylix];
  # Stylix
  stylix = {
    enable = true;
    autoEnable = true;
    image = config.theme.wallpaperDark;
    base16Scheme = {
      base00 = "242424"; # ----
      base01 = "3c3836"; # ---
      base02 = "504945"; # --
      base03 = "665c54"; # -
      base04 = "bdae93"; # +
      base05 = "d5c4a1"; # ++
      base06 = "ebdbb2"; # +++
      base07 = "fbf1c7"; # ++++
      base08 = "fb4934"; # red
      base09 = "fe8019"; # orange
      base0A = "fabd2f"; # yellow
      base0B = "b8bb26"; # green
      base0C = "8ec07c"; # aqua/cyan
      base0D = "7daea3"; # blue
      base0E = "e089a1"; # purple
      base0F = "f28534"; # brown
    };
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
