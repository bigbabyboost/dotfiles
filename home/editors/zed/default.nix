{pkgs, ...}: {
  programs.zed-editor = {
  	enable = true;
  	userSettings = {
  	  telemetry = {
  	  	metric = false;
  	  	diagnostic = false;
  	  };
  	  ui_font_size = 13;
  	  language = {
  	  	Nix = {
  	  	  formatter = {
  	  	  	external = {
  	  	  	  command = "alejandra";
  	  	  	  arguments = [];
  	  	  	};
  	  	  };
  	  	};
  	  };
  	};
  	extensions = [
  	  "nix"
  	  "xy-zed"
  	  "xml"
  	  "swift"
  	  "vue"
  	  "vala"
  	  "syntax"
  	  "golangci-lint"
  	  "kdl"
  	  "ron"
  	  "meson"
  	  "jsonnet"
  	  "superhtml"
  	  "catppuccin"
  	  "catppuccin-blur-plus"
  	  "catppuccin-icons"
  	  "python-refactoring"
  	];
  };

  home.packages = with pkgs; [
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nil
    typescript-language-server
  ];
}
