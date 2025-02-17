{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
      	source = ./nixcat.png;
      	type = "kitty-direct";
      	padding = {
      	  left = 2;
      	  top = 1;
      	};
      	width = 30;
      	height = 13;
      };
      display = {
        separator = " | ";
      };
      modules = [
      	"break"
      	{
      	  type = "title";
      	  keyWidth = 10;
      	}
      	"break"
      	{
      	  type = "os";
      	  key = " ";
      	  keyColor = "red";
      	}
      	{
      	  type = "kernel";
      	  key = " ";
      	  keyColor = "blue";
      	}
      	{
      	  type = "shell";
      	  key = " ";
      	  keyColor = "green";
      	}
      	{
      	  type = "wm";
      	  key = " ";
      	  keyColor = "yellow";
      	}
        {
          type = "uptime";
          key = " ";
          keyColor = "cyan";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 0;
          symbol = "circle";
        }
      ];
    };	
  };
}
