{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    hjem.url = "github:feel-co/hjem";
    hjem.inputs.nixpkgs.follows = "nixpkgs";
  
  };

  outputs = inputs:
  let
    lib = inputs.nixpkgs.lib.extend (final: prev: {
      custom = import ./lib { lib = final; };
    });
  in
    # Makes my lib.custom helpers available in all modules
    inputs.flake-parts.lib.mkFlake
      { inherit inputs; specialArgs = { inherit lib; }; }
      (lib.custom.importRecursive ./modules);
}