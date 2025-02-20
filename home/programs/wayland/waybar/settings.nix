{
  config,
  pkgs,
  ...
}: let
  custom = {
    font = "Adwaita Sans";
    font_size = "9pt";
    font_weight = "bold";
    opacity = "1";
    indicator_height = "2px";
    color0 = "#1e1e2e";      # base
    color1 = "#181825";      # mantle
    color2 = "#313244";      # surf_0
    color3 = "#45475a";      # surf_1
    color4 = "#585b70";      # surf_2
    color5 = "#cdd6f4";      # text
    color6 = "#f5e0dc";      # rosewater
    color7 = "#b4befe";      # lavender
    color8 = "#f5c2e7";      # pink
    color9 = "#fab387";      # peach
    colora = "#f9e2af";      # yellow
    colorb = "#a6e3a1";      # green
    colorc = "#94e2d5";      # teal
    colord = "#89b4fa";      # blue
    colore = "#cba6f7";      # mauve
    colorf = "#f38ba8";      # red
  };
in {
  programs.waybar = {
    settings = with custom; [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [
          "image"
          "niri/workspaces"
          "idle_inhibitor"
          "niri/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "group/network-modules"
          "group/wireplumber-modules"
#          "group/backlight-modules"
          "group/battery-modules"
          "tray"
          "custom/notifications"
          "group/powermenu"
        ];

        "image" = {
          path = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          size = 24;
          tooltip = false;
        };

        "niri/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          all-outputs = true;
          format-icons = {
            "default" = "";
            "urgent" = "";
            "focused" = "";
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰾪";
          };
        };

        "niri/window" = {
          format = "󰣆 {title}";
          max-length = 40;
          separate-outputs = true;
          rewrite = {
            "^.*( — Zen Browser|Zen Browser)$" = "󰈹 Zen";
            "^.*( — Firefox|Firefox)$" = "󰈹 Firefox";
            "^.*( — Chromium|Chromium)$" = "󰈹 Chromium";
            "^.*v( .*|$)" = " Neovim";
            "^.*~$" = "󰄛 Kitty";
            "^.*(- Spotify|Spotify)$" = "󰏤 Spotify";
            "^.*(- Code|Code)$" = "󰈹 VSCode";
            "(.*) " = " Empty";
          };
        };

        "group/network-modules" = {
          modules = [
            "network#icon"
            "network#address"
          ];
          orientation = "inherit";
        };
        "network#icon" = {
          format-disconnected = "󰤮";
          format-ethernet = "󰈀";
          format-wifi = "󰤨";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        "network#address" = {
          format-disconnected = "Disconnected";
          format-ethernet = "{ipaddr}/{cidr}";
          format-wifi = "{essid}";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
        };

        "group/wireplumber-modules" = {
          modules = [
            "wireplumber#icon"
            "wireplumber#volume"
          ];
          orientation = "inherit";
        };
        "wireplumber#icon" = {
          format = "{icon}";
          format-muted = "󰖁";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          on-click = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle &> /dev/null";
          on-scroll-up = "${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%+ &> /dev/null";
          on-scroll-down = "${pkgs.wireplumber}/bin/wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%- &> /dev/null";
          tooltip-format = "Volume: {volume}%";
        };
        "wireplumber#volume" = {
          format = "{volume}%";
          tooltip-format = "Volume: {volume}%";
        };

        "group/backlight-modules" = {
          modules = [
            "backlight#icon"
            "backlight#percent"
          ];
          orientation = "inherit";
        };
        "backlight#icon" = {
          format = "{icon}";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 1%+ &> /dev/null";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 1%- &> /dev/null";
          tooltip-format = "Backlight: {percent}%";
        };
        "backlight#percent" = {
          format = "{percent}%";
          tooltip-format = "Backlight: {percent}%";
        };

        "group/battery-modules" = {
          modules = [
            "battery#icon"
            "battery#capacity"
          ];
          orientation = "inherit";
        };
        "battery#icon" = {
          format = "{icon}";
          format-charging = "󱐋";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format-plugged = "󰚥";
          states = {
            warning = 30;
            critical = 15;
          };
          tooltip-format = "{timeTo}, {capacity}%";
        };
        "battery#capacity" = {
          format = "{capacity}%";
          tooltip-format = "{timeTo}, {capacity}%";
        };

        tray = {
          icon-size = 15;
          spacing = 10;
          show-passive-items = false;
        };

        clock = {
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          calendar = {
            format = {
              days = "<span color='${color8}'><b>{}</b></span>";
              months = "<span color='${color7}'><b>{}</b></span>";
              today = "<span color='${color7}'><b><u>{}</u></b></span>";
              weekdays = "<span color='${colord}'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
          format = "{:%I:%M %p}";
          tooltip-format = "{calendar}";
        };

        "group/powermenu" = {
          drawer = {
            children-class = "powermenu-child";
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "custom/power"
            "custom/lock"
            "custom/suspend"
            "custom/exit"
            "custom/reboot"
          ];
          orientation = "inherit";
        };
        "custom/power" = {
          format = "󰐥";
          on-click = "${pkgs.systemd}/bin/systemctl poweroff";
          tooltip = false;
        };
        "custom/lock" = {
          format = "󰌾";
          on-click = "${pkgs.systemd}/bin/loginctl lock-session";
          tooltip = false;
        };
        "custom/suspend" = {
          format = "󰤄";
          on-click = "${pkgs.systemd}/bin/systemctl suspend";
          tooltip = false;
        };
        "custom/exit" = {
          format = "󰍃";
          on-click = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
          tooltip = false;
        };
        "custom/reboot" = {
          format = "󰜉";
          on-click = "${pkgs.systemd}/bin/systemctl reboot";
          tooltip = false;
        };
        "custom/notifications" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "󱅫 ";
            none = "󰂚 ";
            dnd-notification = "󰂛 ";
            dnd-none = "󰂛 ";
            inhibited-notification = "󰂚 ";
            inhibited-none = "󰂚 ";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰂛 ";
          };
          return-type = "json";
          exec-if = "${pkgs.swaynotificationcenter}/bin/swaync-client";
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          escape = true;
        };
      }
    ];

    style = with custom; ''
      /* Global */
      * {
        all: unset;
        font-family: ${font};
        font-size: 9pt;
        font-weight: bold;
      }

      /* Menu */
      menu {
        background: ${color1};
        border-radius: 12px;
      }

      menu separator {
        background: ${colore};
      }

      menu menuitem {
        background: transparent;
        padding: 0.5rem;
        transition: 300ms linear;
      }

      menu menuitem:hover {
        background: lighter(${color2});
      }

      menu menuitem:first-child {
        border-radius: 12px 12px 0 0;
      }

      menu menuitem:last-child {
        border-radius: 0 0 12px 12px;
      }

      menu menuitem:only-child {
        border-radius: 12px;
      }

      /* Tooltip */
      tooltip {
        background: ${color1};
        border-radius: 12px;
      }

      tooltip label {
        margin: 0.5rem;
      }

      /* Waybar */
      window#waybar {
        background: ${color1};
      }

      .modules-left {
        padding-left: 0.25rem;
      }

      .modules-right {
        padding-right: 0.25rem;
      }

      /* Modules */
      #workspaces,
      #workspaces button,
      #idle_inhibitor,
      #wireplumber-modules,
      #backlight-modules,
      #battery-modules,
      #network-modules,
      #tray,
      #clock,
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        background: ${color2};
        border-radius: 8px;
        margin: 0.5rem 0.25rem;
        transition: 300ms linear;
      }

      #image,
      #window,
      #network.address,
      #wireplumber.volume,
      #backlight.percent,
      #battery.capacity,
      #tray,
      #clock {
        padding: 0.25rem 0.75rem;
      }

      #idle_inhibitor,
      
      #network.icon {
        background: ${colorc};
        color: ${color2};
        border-radius: 8px;
        font-size: 13pt;
        padding: 0.25rem;
        min-width: 1.5rem;
      }

      #wireplumber.icon {
        background: ${color8};
        color: ${color2};
        border-radius: 8px;
        font-size: 13pt;
        padding: 0.25rem;
        min-width: 1.5rem;
      }

      #backlight.icon,
      
      #battery.icon {
        background: ${colora};
        color: ${color2};
        border-radius: 8px;
        font-size: 9pt;
        padding: 0.25rem;
        min-width: 1.5rem;
      }
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        background: ${color7};
        color: ${color2};
        border-radius: 8px;
        font-size: 13pt;
        padding: 0.25rem;
        min-width: 1.5rem;
        transition: 300ms linear;
      }

      #custom-notifications {
        background: ${color9};
        color: ${color2};
        border-radius: 8px;
        font-size: 14pt;
        padding-left: 0.76rem;
        min-width: 1.5rem;
        margin: 0.5rem 0.25rem;
      }

      /* Workspaces */
      #workspaces button {
        margin: 0;
        padding: 0.25rem;
        min-width: 1.5rem;
      }

      #workspaces button label {
        color: ${color5};
      }

      #workspaces button.empty label {
        color: ${color4};
      }

      #workspaces button.urgent label,
      #workspaces button.active label {
        color: ${color2};
      }

      #workspaces button.urgent {
        background: ${color9};
      }

      #workspaces button.active {
        background: ${colore};
      }

      /* Idle Inhibitor */
      #idle_inhibitor {
        background: ${color2};
        color: ${colore};
      }

      #idle_inhibitor.deactivated {
        color: ${color4};
      }

      /* Systray */
      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background: ${colora};
      }

      /* Hover effects */
      #workspaces button:hover,
      #idle_inhibitor:hover,
      #idle_inhibitor.deactivated:hover,
      #clock:hover {
        background: lighter(${color2});
      }

      #workspaces button.urgent:hover {
        background: lighter(${colorf});
      }

      #workspaces button.active:hover,
      #network.icon:hover,
      #wireplumber.icon:hover,
      #custom-exit:hover,
      #custom-lock:hover,
      #custom-suspend:hover,
      #custom-reboot:hover,
      #custom-power:hover {
        background: lighter(${color6});
      }

      #workspaces button.urgent:hover label,
      #workspaces button.active:hover label,
      #network.icon:hover label,
      #wireplumber.icon:hover label,
      #custom-exit:hover label,
      #custom-lock:hover label,
      #custom-suspend:hover label,
      #custom-reboot:hover label,
      #custom-power:hover label {
        color: lighter(${color2});
      }

      #workspaces button:hover label {
        color: lighter(${color5});
      }

      #workspaces button.empty:hover label {
        color: lighter(${color4});
      }

      #idle_inhibitor:hover {
        color: lighter(${colorc});
      }

      #idle_inhibitor.deactivated:hover {
        color: lighter(${color4});
      }
    '';
  };
}
