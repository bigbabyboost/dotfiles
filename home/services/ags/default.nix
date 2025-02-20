{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    inputs.ags.packages.${pkgs.system}.notifd
    inputs.ags.packages.${pkgs.system}.mpris
    inputs.ags.packages.${pkgs.system}.auth
    material-symbols
    wl-screenrec
    dart-sass
    pavucontrol
    procps
    gjs
    inputs.ags.packages.${pkgs.system}.io
  ];

  programs.ags = {
    enable = true;
    extraPackages = [
      pkgs.libsoup_3
      pkgs.gtksourceview
      pkgs.libnotify
      pkgs.webkitgtk_4_1
      pkgs.gst_all_1.gstreamer
      inputs.ags.packages.${pkgs.system}.apps
      inputs.ags.packages.${pkgs.system}.battery
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.wireplumber
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.notifd
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.bluetooth
      inputs.ags.packages.${pkgs.system}.auth
    ];
  };
  
  home.file.".config/ags_res/colors.scss".text = with config.lib.stylix.colors; ''
    $base00: #${base00};
    $base01: #${base01};
    $base02: #${base02};
    $base03: #${base03};
    $base04: #${base04};
    $base05: #${base05};
    $base06: #${base06};
    $base07: #${base07};
    $base08: #${base08};
    $base09: #${base09};
    $base0A: #${base0A};
    $base0B: #${base0B};
    $base0C: #${base0C};
    $base0D: #${base0D};
    $base0E: #${base0E};
    $base0F: #${base0F};
  '';
  
  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
      After = "graphical-session.target";
    };
    Service = {
      Environment = "XDG_SESSION_TYPE=wayland";
      ExecStart = "/etc/profiles/per-user/xaolan/bin/ags run";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
  systemd.user.services.gsd-rfkill = {
    Unit = {
      Description = "Gnome RFKill support service";
    };
    Service = {
      BusName = "org.gnome.SettingsDaemon.Rfkill";
      ExecStart = "${pkgs.gnome-settings-daemon}/libexec/gsd-rfkill";
      Restart = "on-failure";
      TimeoutStopSec = "5";
      Type = "dbus";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
