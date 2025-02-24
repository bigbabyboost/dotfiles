{
  pkgs,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = lib.mkForce "Cozette:size=11";
        horizontal-letter-offset = 0.5;
        vertical-letter-offset = 0;
        pad = "4x4 center";
        letter-spacing = 0.5;
        selection-target = "clipboard";
      };

      bell = {
        urgent = "yes";
        notify = "yes";
      };

      desktop-notifications = {
        command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3;
        indicator-position = "relative";
        indicator-format = "line";
      };

      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        protocols = "http, https, ftp, ftps, file, mailto, ipfs";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };

      colors = {
        alpha = 1.0;
      };
    };
  };
}
