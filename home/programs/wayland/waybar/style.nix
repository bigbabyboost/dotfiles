{ ... }:
let
  custom = {
    font = "Maple Mono NF";
    font_size = "13px";
    font_weight = "bold";
    opacity = "1";
    indicator_height = "2px";
    base = "#1e1e2e";
    color0 = "#cdd6f4";      # use background_0 as base
    color8 = "#181825";            # text color becomes color8
    crust = "#2B2B3A";     # use background_1 as crust
    color9 = "#cdd6f4";   # workspace button text color
    color2 = "#b4befe";           # active button background
    color7 = "#cdd6f4";       # focused button background
    color4 = "#f38ba8";             # urgent button background
    color1 = "#cdd6f4";          # CPU/memory text color
    color6 = "#cdd6f4";       # clock text color
    color3 = "#cdd6f4";            # network text color
    color5 = "#cdd6f4";          # pulseaudio text color
  };
in
{
  programs.waybar = {
    style = with custom; ''
      * {
        all: unset;
        border: none;
        font-family: ${font};
        font-size: 11pt;
        font-weight: bold;
      }

      window#waybar {
        background: ${base};
        color: ${color8};
      }

      tooltip {
        background: ${base};
        border-color: ${crust};
        border-radius: 10px;
        border-style: solid;
        border-width: 2px;
      }

      #backlight,
      #cpu,
      #custom-swaync,
      #memory,
      #network,
      #pulseaudio,
      #tray,
      #clock,
      #window,
      #mpris,
      #workspaces {
        background: ${crust};
        border-radius: 8px;
        border: 1px solid ${crust};
        font-weight: 600;
        margin: 6px 0 6px 0;
        padding: 3.5px 16px;
      }

      #tray {
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #workspaces {
        font-weight: Bold;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 3.5px;
        padding-right: 3.5px;
      }

      #workspaces :nth-child(5) {
        margin-right: 0px;
      }

      #workspaces button {
        border-radius: 6px;
        color: ${color9};
        padding: 6px;
        margin-right: 5px;
      }

      #workspaces button.active {
        background: ${color2};
        color: ${color8};
      }

      #workspaces button.focused {
        background: ${color7};
        color: ${color8};
      }

      #workspaces button.urgent {
        background: ${color4};
        color: ${color8};
      }

      #workspaces button:hover {
        background: ${crust};
        color: ${color7};
      }

      #window {
        background: transparent;
        border-radius: 10px;
        margin-left: 60px;
        margin-right: 60px;
      }

      #cpu,
      #memory {
        color: ${color1};
      }

      #cpu {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 0;
      }

      #memory {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
      }

      #mpris {
        color: ${color7};
        margin-left: 10px;
      }

      #clock {
        border-right: 0px;
        color: ${color6};
        font-weight: 600;
        margin-right: 10px;
      }

      #custom-swaync {
        color: ${color1};
        margin-right: 10px;
        padding-right: 18px;
      }

      #network {
        color: ${color3};
        margin-right: 10px;
      }

      #pulseaudio {
        border-left: 0px;
        border-right: 0px;
        color: ${color5};
        margin-right: 10px;
      }
    '';
  };
}
