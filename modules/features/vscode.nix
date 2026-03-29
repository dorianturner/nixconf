{ self, inputs, ... }:

{
  flake.nixosModules.vscode = { pkgs, ... }: {

    programs.vscode = {
      enable = true;

      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        vscodevim.vim
        yzhang.markdown-all-in-one
        bbenoist.nix
      ];
    
    };
  };
}
