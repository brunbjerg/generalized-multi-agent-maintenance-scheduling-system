{
  description = "A flake for the generalized-maintenance-scheduling-system repo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          inherit system;
        };
        
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.fish
            pkgs.emacs
            pkgs.just
            pkgs.deno
            pkgs.typst
            pkgs.tectonic
            pkgs.perl540Packages.LatexIndent
            pkgs.texlivePackages.epstopdf
            pkgs.zathura
            pkgs.entr
            (pkgs.gnuplot.override {
              withLua = true;
              lua = pkgs.lua;
            })
            pkgs.lua
            pkgs.xfig
            pkgs.python312Packages.sympy
          ];
        };
    });
}
