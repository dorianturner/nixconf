{ self, inputs, ... }:

{
  flake.nixosModules.devtools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vim
      neovim
      wget
      git
      libgcc

      # c/c++
      gcc
      gdb
      cmake
      pkg-config

      # rust
      rustup

      # haskell
      #ghc
      #cabal-install
      #haskell-language-server

      # web
      #nodejs
      #pnpm
      #typescript

      # misc dev tools
      jq
      ripgrep
      fd
    ];
  };
}