{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [
    pkgs.distrobox
    pkgs.podman-compose
    pkgs.boxbuddy
  ];
}
