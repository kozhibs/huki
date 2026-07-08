{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hjem.url = "github:feel-co/hjem";
  };

  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    mkFlake = inputs.flake-parts.lib.mkFlake {inherit inputs;};
  in
    mkFlake {imports = importTree ./.;};
}
