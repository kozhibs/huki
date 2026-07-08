{ self, inputs, ... }: {
  flake.nixosModules.helix = { config, lib, pkgs, ... }: {  
    environment.systemPackages = [ pkgs.helix ];
      hjem.users.yourusername.files = {
        ".config/helix/config.toml" = {
          generator = "lib.generators.toTOML {}";
          value = {
          theme = "autumn";
        
          editor = {
            line-number = "relative";
            mouse = true;
            cursorline = true;
            scrolloff = 5;
            color-modes = true;
          
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };
          
            statusline = {
              left = [ "mode" "spinner" ];
              center = [ "file-name" ];
              right = [ "diagnostics" "selections" "position" "file-encoding" ];
            };
          };
        };
      };

      ".config/helix/languages.toml" = {
        generator = "lib.generators.toTOML {}";
        value = {
          language = [
            {
              name = "nix";
              auto-format = true;
              formatter = { command = "nixpkgs-fmt"; };
            }
          ];
        };
      };
    };
  };
}
