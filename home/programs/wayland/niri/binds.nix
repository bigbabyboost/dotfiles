{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    "XF86AudioMute".action = spawn "swayosd-client" "--output-volume=mute-toggle";
    "XF86AudioMicMute".action = spawn "swayosd-client" "--input-volume=mute-toggle";

    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";

    "XF86AudioRaiseVolume".action = spawn "swayosd-client" "--output-volume=raise";
    "XF86AudioLowerVolume".action = spawn "swayosd-client" "--output-volume=lower";

    "XF86MonBrightnessUp".action = spawn "swayosd-client" "--brightness=raise";
    "XF86MonBrightnessDown".action = spawn "swayosd-client" "--brightness=lower";

    "Print".action = screenshot-screen;
    "Mod+Print".action = screenshot-window;
    "Mod+Shift+S".action = screenshot;
    "Mod+D".action = spawn "uwsm" "app" "--" "${pkgs.anyrun}/bin/anyrun";
    "Mod+Return".action = spawn "uwsm" "app" "--" "${pkgs.wezterm}/bin/wezterm";
    "Mod+Shift+Return".action = spawn "uwsm" "app" "--" "${pkgs.ghostty}/bin/ghostty";
    "Ctrl+Alt+L".action = spawn "uwsm" "app" "--" "sh -c pgrep hyprlock || hyprlock";

    "Mod+I".action = spawn "XDG_CURRENT_DESKTOP=gnome" "uwsm" "app" "--" "gnome-control-center";
    "Mod+E".action = spawn "uwsm" "app" "--" "nautilus";
    "Mod+B".action = spawn "uwsm" "app" "--" "google-chrome-stable";

    "Mod+Q".action = close-window;
    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Space".action = toggle-window-floating;

    "Mod+Shift+BracketLeft".action = consume-window-into-column;
    "Mod+Shift+BracketRight".action = expel-window-from-column;
    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;
    "Mod+C".action = center-window;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Equal".action = set-window-height "+10%";

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;
    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Shift+Home".action = move-column-to-first;
    "Mod+Shift+End".action = move-column-to-last;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Up".action = move-column-to-workspace-up;
    "Mod+Shift+Down".action = move-column-to-workspace-down;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;
    "Mod+Ctrl+1".action = move-column-to-workspace 1;
    "Mod+Ctrl+2".action = move-column-to-workspace 2;
    "Mod+Ctrl+3".action = move-column-to-workspace 3;
    "Mod+Ctrl+4".action = move-column-to-workspace 4;
    "Mod+Ctrl+5".action = move-column-to-workspace 5;
    "Mod+Ctrl+6".action = move-column-to-workspace 6;
    "Mod+Ctrl+7".action = move-column-to-workspace 7;
    "Mod+Ctrl+8".action = move-column-to-workspace 8;
    "Mod+Ctrl+9".action = move-column-to-workspace 9;

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
  };
}
