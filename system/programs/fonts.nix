{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) fonts
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto
      (google-fonts.override {fonts = ["Inter"];})
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro
      inputs.apple-fonts.packages.${pkgs.system}.ny
      adwaita-fonts

      # monospace fonts
      jetbrains-mono

      # nerdfonts
      maple-mono-NF
      nerd-fonts.commit-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.fantasque-sans-mono

      # bitmap fomts
      cozette
      spleen
      nerd-fonts.gohufont
      scientifica
      curie

      # pixels
      zpix-pixel-font
      vt323
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = let
      addAll = builtins.mapAttrs (_: v: v ++ ["Noto Color Emoji"]);
    in
      addAll {
        serif = ["New York"];
        sansSerif = ["Adwaita Sans"];
        monospace = ["FantasqueSansM Nerd Font"];
        emoji = [];
      };
  };
}
