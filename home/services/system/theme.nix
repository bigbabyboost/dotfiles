{
  lib,
  pkgs,
  ...
}: 
let
  # Define common runtime inputs
  commonRuntimeInputs = with pkgs; [ home-manager coreutils ripgrep ];

  # Define the 'lighto' shell application
  lighto = pkgs.writeShellApplication {
    name = "lighto";
    runtimeInputs = commonRuntimeInputs;
    text = ''
      "$(home-manager generations | head -1 | rg -o '/[^ ]*')"/specialisation/lighto/activate
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Gruvbox-Plus-Light'"
      ${pkgs.systemd}/bin/systemctl  --user restart ags
    '';
  };

  darko = pkgs.writeShellApplication {
    name = "darko";
    runtimeInputs = commonRuntimeInputs;
    text = ''
      "$(home-manager generations | head -2 | tail -1 | rg -o '/[^ ]*')"/activate
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/icon-theme "'Gruvbox-Plus-Dark'"
      ${pkgs.systemd}/bin/systemctl --user restart ags
     '';
  };
  
in
{   
  systemd.user.timers = {
    theme-toggle-dark = {
      Unit.Description = "Toggle dark theme";
      Timer.OnCalendar = [
        "*-*-* 18:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };

    theme-toggle-light = {
      Unit.Description = "Toggle light theme";
      Timer.OnCalendar = [
        "*-*-* 06:00:00"
      ];
      Install.WantedBy = ["graphical-session.target"];
    };
  };
  systemd.user.services = {
    theme-toggle-dark = {
      Unit.Description = "Toggle dark theme";
      Service = {
        Type = "simple";
        ExecStart = "${darko}/bin/darko";
        TimeoutStopSec = 5;
      };
    };

    theme-toggle-light = {
      Unit.Description = "Toggle light theme";
      Service = {
        Type = "simple";
        ExecStart = "${lighto}/bin/lighto";
        TimeoutStopSec = 5;
      };
    };
  };
}
