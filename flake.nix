{
  description = "git rebase --interactive mimic for darcs";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url     = "nixpkgs";

  outputs = { self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        bin  = pkgs.writeScriptBin name (builtins.readFile ./${name});
        name = "darcs-rebase-i";
        path = bin.overrideAttrs(old: {
            buildCommand = "${old.buildCommand}\n patchShebangs $out";
            });
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        overlays.default        = self.overlays.${system}.${name};
        overlays.darcs-rebase-i = final: prev: {
          darcs-rebase-i = self.packages.${system}.default;
        };

        packages.default        = self.packages.${system}.${name};
        packages.darcs-rebase-i = pkgs.symlinkJoin {
          name        = name;
          paths       = [ path pkgs.coreutils pkgs.darcs ];
          buildInputs = [ pkgs.makeWrapper ];
          postBuild   = "wrapProgram $out/bin/${name} --prefix PATH : $out/bin";
        };
      }
    );
}
