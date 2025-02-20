{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  # we need git for flakes
  environment.systemPackages = [
    pkgs.git
    pkgs.ffmpeg-full
    pkgs.libaom
    pkgs.libavif
    pkgs.openh264
    pkgs.gst_all_1.gst-vaapi
    pkgs.gst_all_1.gst-libav
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-ugly
    pkgs.x264
    pkgs.x265
    pkgs.libvpx
    pkgs.mesa
    pkgs.vulkan-tools
    pkgs.vulkan-loader
  ];

  nix = let
    flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
  in {
    package = pkgs.lix;

    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) flakeInputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = ["root" "@wheel"];

      accept-flake-config = false;
    };
  };
}
