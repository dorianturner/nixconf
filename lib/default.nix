{ lib }:

let
  helper = file: import file { inherit lib; };
in
# If a helper I make here needs another one, use lib.fix (maybe)
{
  importRecursive = helper ./importRecursive.nix;
}