{
  lib,
  pkgs,
  config,
  ...
}: {
  services.swaync = {
    enable = false;
    package = pkgs.swaynotificationcenter;
    # style = pkgs.fetchurl {
    #  url = "https://github.com/catppuccin/swaync/releases/download/v0.2.3/mocha.css";
    #  sha256 = "sha256-Hie/vDt15nGCy4XWERGy1tUIecROw17GOoasT97kIfc=";
    # };

    settings = {
      positionX = "right";
      positionY = "top";
      layer = "top";
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-icon-size = 58;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;

      widgets = [
        "title"
        "notifications"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };

        dnd.text = "Do Not Disturb";
      };
    };
  };
}
