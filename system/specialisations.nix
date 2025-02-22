{self, config, pkgs, lib, ...}: {
  specialisation = {
  	niri = {
  	  inheritParentConfig = true;
  	  configuration =  {
        environment.etc."specialisation".text = "niri";
        home-manager.users.xaolan = {
          programs.ags.enable = lib.mkForce false;
          services.swaync = {
            enable = lib.mkForce true;
            package = lib.mkForce pkgs.swaynotificationcenter;
          };
          services.hypridle = {
            settings = lib.mkForce {
		      general.lock_cmd = lib.getExe config.programs.hyprlock.package;   
              listener = [
                {
                  timeout = 300 - 10;
                  on-timeout = "${lib.getExe pkgs.brillo} -O; ${lib.getExe pkgs.brillo} -u 500000 -S 10";
                  on-resume = "${lib.getExe pkgs.brillo} -I -u 250000";
                }
                {
                  timeout = 300;
                  on-timeout = "${lib.getExe pkgs.niri} msg action power-off-monitors";
                  on-resume = "${lib.getExe pkgs.niri} msg action power-on-monitors";
                }
                {
                  timeout = 300 + 10;
                  on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
                }
              ];
            };
          };
        };
        services.greetd = let
          session = {
            command = lib.mkForce "${lib.getExe config.programs.uwsm.package} start ${pkgs.niri}/share/wayland-sessions/niri.desktop";
            user = "xaolan";
          };
        in {
          enable = true;
          settings = {
            terminal.vt = 1;
            default_session = session;
            initial_session = session;
          };
        };

        programs.uwsm = {
          enable = true;
          waylandCompositors.niri = {
            binPath = lib.mkForce "${pkgs.niri}/bin/niri-session";
            prettyName = lib.mkForce "Niri";
            comment = lib.mkForce "Niri managed by UWSM";
          };
        };
      };
    };
  };
}
