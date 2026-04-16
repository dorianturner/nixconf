{ self, inputs, ... }:

# Marketplace-only VSCode extensions (not available in nixpkgs)
# How to add a new extension:
#
# 1. Find extension on: https://marketplace.visualstudio.com/
# 2. Extract identifiers:
#    - publisher (e.g. "kdl-org")
#    - name (e.g. "kdl")
#    - version (from marketplace page)
#
# 3. Construct URL:
#    https://marketplace.visualstudio.com/_apis/public/gallery/
#    publishers/<publisher>/vsextensions/<name>/<version>/vspackage
#
# 4. Fetch hash: nix-prefetch-url <URL>
# 5. Convert hash to SRI format: nix hash convert sha256:<hash>
#
# If extension updates, you MUST update version + sha256 together

{
  flake.nixosModules.vscode = { pkgs, ... }: {

    programs.vscode = {
      enable = true;

      extensions = 
      with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        vscodevim.vim
        yzhang.markdown-all-in-one
        bbenoist.nix
        vscode-icons-team.vscode-icons
      ] 
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "kdl";
            publisher = "kdl-org";
            version = "2.1.3";
            sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
          }
      ];
    };
  };
}
