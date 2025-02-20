{pkgs, ...}:
{
  programs.waybar = {
  	enable = true;
  	systemd.target = "niri-session";
  };
}
