{
  pkgs,
  self,
  # inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./powersave.nix
    ./disk-configuration.nix
  ];

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

  boot = {
    kernelModules = ["kvm-intel" "i915"];
    kernelParams = [
      "i915.enble_fbc=1"
      "i915.enble_guc=1"
    ];
  };

  # nh default flake
  environment.variables.FLAKE = "/home/xaolan/Documents/code/snekbox";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "micro";
    TERM = "ghostty";
    TERMINAL = "ghostty";
  };

  environment.localBinInPath = true;

  networking.hostName = "ionia";

  security.tpm2.enable = true;

  services = {
    # for SSD/NVME
    fstrim.enable = true;

    # Flatpak support
    flatpak.enable = true;
  };
}
