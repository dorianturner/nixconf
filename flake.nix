{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    hjem.url = "github:feel-co/hjem";
    hjem.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    nix-mineral.url = "github:cynicsketch/nix-mineral/";
  
  };

  # Caching cos who likes building binaries from scratch
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
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