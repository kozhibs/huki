{ self, inputs, ... }: {
  flake.nixosModules.helix = { config, lib, pkgs, ... }: {

    hjem.users.taito.xdg.config.files."helix/config.toml".text = ''
      theme = "autumn"

      [editor]
      line-number = "relative"
      cursorline = true
      mouse = true
      bufferline = "multiple"
      auto-format = true
      color-modes = true

      [editor.cursor-shape]
      insert = "bar"
      normal = "block"
      select = "underline"

      [editor.indent-guides]
      render = true

      [editor.lsp]
      display-messages = true
     '';

    hjem.users.taito.xdg.config.files."helix/languages.toml".text = ''
      [[language]]
      name = "nix"
      language-servers = ["nil"]
      formatter = { command = "nixfmt" }
      auto-format = true
    '';
  };
}
