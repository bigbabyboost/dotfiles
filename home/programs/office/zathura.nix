{pkgs, config, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor-lightcolor = "rgba(0,0,0,0)";
      default-bg = "rgba(0,0,0,0.7)";

      font = config.stylix.fonts.serif.name;
      selection-notification = true;

      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      zoom-min = "10";
    };
    extraConfig = "include zathura-gruvbox-dark";
  };

  xdg.configFile = {
    "zathura/gruvbox-dark-hard".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/eastack/zathura-gruvbox/master/zathura-gruvbox-dark";
      hash = "sha256-CjfabF+RJgKvyVYJXteYcAftW9Z5EwEvzI8IevubiJo=";
    };
  };
}
