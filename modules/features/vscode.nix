{ self, inputs, ... }:

{
  flake.nixosModules.vscode = { pkgs, ... }: {

    programs.vscode.enable = true;

  };
}
