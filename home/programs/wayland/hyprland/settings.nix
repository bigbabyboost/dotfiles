{config, lib, ...}: let
  pointer = config.stylix.cursor;

  cursorName = "Bibata-Modern-Classic-Hyprcursor";
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "ghostty";
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "HYPRCURSOR_THEME,${cursorName}"
      "HYPRCURSOR_SIZE,${toString pointer.size}"
    ];

    exec-once = [
      # finalize startup
      "uwsm finalize"
      # set cursor for HL itself
      "hyprctl setcursor ${cursorName} ${toString pointer.size}"
      "hyprlock"
      "swww-daemon"
    ];

    general = {
      layout = "scroller";
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgb(${config.lib.stylix.colors.base05})";
      "col.inactive_border" = "rgb(${config.lib.stylix.colors.base03})";

      allow_tearing = true;
      resize_on_border = true;
    };

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.1;

        vibrancy = 0.5;
        vibrancy_darkness = 0.1;
        xray = true;

        passes = 3;
        size = 10;
        new_optimizations = true;
        ignore_opacity = true;

        popups = true;
        popups_ignorealpha = 0.2;
      };

      fullscreen_opacity = 1;

      shadow = {
        enabled = true;
        color = "rgba(00000055)";
        ignore_window = true;
        offset = "0 8";
        range = 50;
        render_power = 2;
        scale = 0.97;
      };
    };

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];
    };

    group = {
      groupbar = {
        font_size = 10;
        gradients = false;
        text_color = "rgb(b6c4ff)";
      };

      "col.border_active" = "rgba(35447988)";
      "col.border_inactive" = "rgba(dce1ff88)";
    };

    input = {
      kb_layout = "us";

      # focus change on cursor move
      follow_mouse = 1;
      accel_profile = "flat";
      tablet.output = "current";
    };
    
    misc = {
      # disable auto polling for config file changes
      disable_autoreload = true;

      force_default_wallpaper = 0;

      # disable dragging animation
      animate_mouse_windowdragging = false;

      # enable variable refresh rate (effective depending on hardware)
      vrr = 1;
    };

    render.direct_scanout = true;

    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    xwayland.force_zero_scaling = true;

    debug.disable_logs = false;

    plugin = {
      scroller = {
      	gesture_scroll_distance = 60;
      	center_row_if_space_available = true;
      	gesture_scroll_enable = true;
      	gesture_scroll_fingers = 3;
      };
      csgo-vulkan-fix = {
        res_w = 1280;
        res_h = 800;
        class = "cs2";
      };

      hyprbars = {
        bar_height = 20;
        bar_precedence_over_border = true;

        # order is right-to-left
        hyprbars-button = [
          # close
          # close
          "rgb(ffb4ab), 15, , hyprctl dispatch killactive"
          # maximize
          "rgb(b6c4ff), 15, , hyprctl dispatch fullscreen 1"
        ];
      };
    };
  };
}
