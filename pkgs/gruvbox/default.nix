{pkgs}: let
  link = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v6.1.1/gruvbox-plus-icon-pack-6.1.1.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";

    src = pkgs.fetchurl {
      url = link;
      sha256 = "sha256-JsZwrqtyAF5+140U6/6PcKq4SM/4QyiR8da7yKh/CJI=";
    };

    dontUnpack = true;
    dontCheckForBrokenSymlinks = true;

    installPhase = ''
      mkdir -p $out/share/icons/
      ${pkgs.unzip}/bin/unzip $src -d $out/share/icons/
    '';
  }
