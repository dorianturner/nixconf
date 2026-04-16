{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "gb,ua";

        input.touchpad.natural-scroll = null;

        layout.gaps = 5;

        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";

        binds = {
          "Mod+L".spawn-sh = "${lib.getExe pkgs.hyprlock}";
          "Mod+R".spawn-sh = "${lib.getExe pkgs.rofi} -show drun -theme gruvbox-dark-soft";
          "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+C".close-window = null;
          "Mod+S".spawn-sh = "${lib.getExe inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default} ipc call launcher toggle";
          "Mod+M".quit = null;  

          "Mod+Shift+S".screenshot = null;

          "Mod+F".maximize-column = null;
          "Mod+Shift+F".fullscreen-window = null;

      	  # Movement
          "Mod+Left".focus-column-left = null;
          "Mod+Right".focus-column-right = null;
          "Mod+Up".focus-workspace-up = null;
          "Mod+Down".focus-workspace-down = null;

	        "Mod+WheelScrollDown".focus-column-left = null;
          "Mod+WheelScrollUp".focus-column-right = null;
          "Mod+Shift+WheelScrollDown".focus-workspace-down = null;
          "Mod+Shift+WheelScrollUp".focus-workspace-up = null;

          "Mod+Shift+H".move-column-left = null;
          "Mod+Shift+L".move-column-right = null;
          "Mod+Shift+K".move-window-up = null;
          "Mod+Shift+J".move-window-down = null;

          "Mod+1".focus-workspace = "w0";
          "Mod+2".focus-workspace = "w1";
          "Mod+3".focus-workspace = "w2";
          "Mod+4".focus-workspace = "w3";
          "Mod+5".focus-workspace = "w4";
          "Mod+6".focus-workspace = "w5";
          "Mod+7".focus-workspace = "w6";
          "Mod+8".focus-workspace = "w7";
          "Mod+9".focus-workspace = "w8";
          "Mod+0".focus-workspace = "w9";

          "Mod+Shift+1".move-column-to-workspace = "w0";
          "Mod+Shift+2".move-column-to-workspace = "w1";
          "Mod+Shift+3".move-column-to-workspace = "w2";
          "Mod+Shift+4".move-column-to-workspace = "w3";
          "Mod+Shift+5".move-column-to-workspace = "w4";
          "Mod+Shift+6".move-column-to-workspace = "w5";
          "Mod+Shift+7".move-column-to-workspace = "w6";
          "Mod+Shift+8".move-column-to-workspace = "w7";
          "Mod+Shift+9".move-column-to-workspace = "w8";
          "Mod+Shift+0".move-column-to-workspace = "w9";
        };

        workspaces = builtins.listToAttrs (
          map (n: { name = "w${toString n}"; value = { layout.gaps = 5; }; })
            (lib.range 0 9)
          );
        
      };
    };
  };
}
