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

        emacsWithPackages = pkgs.emacs.pkgs.emacsWithPackages (epkgs: with epkgs; [
          auctex             # Advanced LaTeX editing
          magit              # Git interface
          org                # Org-mode for organization
          company            # Auto-completion framework
          flycheck           # On-the-fly syntax checking
          yasnippet          # Snippet management
          which-key          # Displays available keybindings
          ivy                # Enhanced completion framework
          counsel            # Collection of Ivy-enhanced commands
          swiper             # Powerful search tool
        ]);
        
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.fish
            emacsWithPackages
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
