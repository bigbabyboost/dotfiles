{
  lib,
  pkgs,
  config,
  ...
}: {
  # Define the GTK settings
	# home.pointerCursor = {
	#   package = pkgs.bibata-cursors;
	#   name = "Bibata-Modern-Ice";
	#   size = 18;
	#   gtk.enable = true;
	#   x11.enable = true;
	# };

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

  };

  # Disable default gtk theme css to avoid conflict
   # xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce true;
   # xdg.configFile."gtk-4.0/gtk-dark.css".enable = lib.mkForce true;
}
