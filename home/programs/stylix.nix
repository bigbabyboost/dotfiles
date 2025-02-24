{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];
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
    iconTheme = {
      enable = true;
      package = inputs.self.packages.${pkgs.system}.gruvbox-plus;
      dark = "Gruvbox-Plus-Dark";
      light = "Gruvbox-Plus-Light";
    };
    fonts = {
      sizes.applications = lib.mkDefault 9;
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.ny;
        name = lib.mkDefault "New York";
      };
      sansSerif = {
        package = lib.mkDefault pkgs.adwaita-fonts;
        name = lib.mkDefault "Adwaita Sans";
      };
      monospace = {
        package = lib.mkDefault pkgs.nerd-fonts.fantasque-sans-mono;
        name = lib.mkDefault "FantasqueSansM Nerd Font";
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
      gtk.enable = true;
      gtk.flatpakSupport.enable = true;
      bat.enable = true;
      btop.enable = true;
      cava.enable = true;
      foot.enable = true;
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
