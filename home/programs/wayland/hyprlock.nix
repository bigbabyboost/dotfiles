{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        immediate_render = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = config.theme.wallpaperDark;
          blur_passes = 3;
          blur_size = 10;
          brightness = 0.8;
        }
      ];

      input-field = [
        {
          monitor = "eDP-1";

          size = "300, 50";
          valign = "bottom";
          position = "0%, 10%";

          outline_thickness = 1;

          font_color = "rgb(${config.lib.stylix.colors.base00})";
          outer_color = "rgb(${config.lib.stylix.colors.base05})";
          inner_color = "rgb(${config.lib.stylix.colors.base05})";
          check_color = "rgb(${config.lib.stylix.colors.base0B})";
          fail_color = "rgb(${config.lib.stylix.colors.base08})";

          fade_on_empty = false;
          placeholder_text = "Enter Password";

          dots_spacing = 0.2;
          dots_center = true;
          dots_fade_time = 100;

          shadow_color = "rgb(${config.lib.stylix.colors.base00})";
          shadow_size = 7;
          shadow_passes = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 150;
          color = "rgb(${config.lib.stylix.colors.base05})";

          position = "0%, 30%";

          valign = "center";
          halign = "center";

          shadow_color = "rgb(${config.lib.stylix.colors.base00})";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
        {
          monitor = "";
          text = "cmd[update:3600000] date +'%a %b %d'";
          font_size = 20;
          color = "rgb(${config.lib.stylix.colors.base05})";

          position = "0%, 15%";

          valign = "center";
          halign = "center";

          shadow_color = "rgb(${config.lib.stylix.colors.base00})";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
      ];
    };
  };
}
