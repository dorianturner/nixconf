{ self, inputs, ... }:

{
  flake.nixosModules.nettools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dnsutils
      inetutils
      net-tools
      wireshark
      busybox
    ];

    programs.wireshark.enable = true;
    programs.wireshark.dumpcap.enable = true;
  };
}