lib:
  let
    collectNixFiles = path:
      let
        entries = builtins.readDir path;
        process = name: type:
          if type == "directory" then collectNixFiles (path + "/${name}")
          else if type == "regular" && lib.hasSuffix ".nix" name then [ (path + "/${name}") ]
          else [];
      in
        lib.concatLists (lib.mapAttrsToList process entries);
  in
    path: { imports = collectNixFiles path; }