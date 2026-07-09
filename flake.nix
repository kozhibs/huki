{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    inputs.qylock.url = "github:Darkkal44/qylock";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    nh.url = "github:nix-community/nh";
    hjem.url = "github:feel-co/hjem";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    (inputs.import-tree ./modules);
}
