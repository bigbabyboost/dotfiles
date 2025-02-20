{
  config,
  pkgs,
  ...
}: let
  shyfox = pkgs.fetchFromGitHub {
    owner = "Naezr";
    repo = "ShyFox";
    rev = "main";
    hash = "sha256-y/Md0VR8h4n4+xzqfVNy7ARf/NG45T440dpHvC5KkkA=";
  };
in {
  programs.firefox = {
    enable = true;
    profiles.xaolan = {
      settings = {
        "apz.overscroll.enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "general.autoScroll" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      extraConfig = builtins.readFile "${shyfox}/user.js";
    };
  };

  home.file.".mozilla/firefox/${config.programs.firefox.profiles.xaolan.path}/chrome".source = "${shyfox}/chrome";
}
