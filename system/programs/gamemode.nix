{inputs, ...}: {
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };

  # see https://github.com/fufexan/nix-gaming/#pipewire-low-latency
  services.pipewire.lowLatency.enable = false;
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
}
