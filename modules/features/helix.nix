{ self, inputs, ... }: {
  flake.nixosModules.helix = { pkgs, ... }: {
    programs.helix = {
      settings = {
        theme = "catppuccin_macchiato"; # Soft, high-contrast, eye-friendly theme

        editor = {
          line-number = "relative";     # Easier code navigation and jumping
          mouse = true;                 # Enable mouse support for scrolling/clicking
          cursorline = true;            # Highlight the line your cursor is on
          scrolloff = 5;                # Keep 5 lines visible above/below cursor when scrolling
          color-modes = true;           # Colorize the mode indicator (Normal/Insert/Select)
          text-width = 80;              # Show a soft wrap indicator at 80 characters
          bufferline = "multiple";      # Show open files/tabs at the top

          cursor-shape = {
          normal = "block";
          insert = "bar";             # Thin vertical bar makes typing feel natural
          select = "underline";
        };

        file-picker = {
          hidden = false;             # Show hidden files (like .gitignore, .env)
          git-ignore = true;          # Hide files that Git ignores (like node_modules)
        };

        lsp = {
          display-messages = true;     # Show LSP initialization progress
          display-inlay-hints = true;  # Show inline type hints (comfy for Rust/TS)
        };

        statusline = {
          left = [ "mode" "spinner" "file-name" "read-only-indicator" "file-modification-indicator" ];
          center = [ "diagnostics" ];
          right = [ "selections" "primary-selection-length" "position" "file-encoding" ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        indent-guides = {
          render = true;              # Show vertical lines for code blocks
          character = "╎";            # Use a subtle, clean character
          skip-levels = 1;            # Don't draw a guide line on the global scope
        };

        soft-wrap = {
          enable = true;              # Wrap long lines instead of cutting them off
          max-wrap = 20;              # Prevent wrapping text too tight to the edge
     };
    };
   };
  };
 };
}
