{ self, inputs, ... }: {
  flake.nixosModules.starship = { config, pkgs, lib, ... }: {
    programs.starship.enable = true;

    hjem.users.taito.xdg.config.files."starship.toml".text = ''
      add_newline = false

      format = """
        $directory\
        [ at ](bold white)\
        $username\
        $git_branch\
        $git_status\
        $cmd_duration\
        $all\
        $line_break\
        $character"""

      [directory]
      format = "[$path]($style)"
      style = "white"
      truncation_length = 4
      truncate_to_repo = true

      [git_branch]
      symbol = " "
      format = "on [$symbol$branch]($style) "
      style = "Bold White"

      [git_status]
      format = "([\\[$all_status$ahead_behind\\]]($style) )"
      style = "white"
      conflicted = "="
      ahead = "↑"
      behind = "↓"
      diverged = "⇄"
      modified = ""
      untracked = ""
      staged = ""
      deleted = ""

      [cmd_duration]
      min_time = 2000
      format = "took [$duration]($style) "
      style = "bold white"

      [character]
      success_symbol = "[λ](white)"
      error_symbol = "[λ](bold white)"
    '';
  };
}
