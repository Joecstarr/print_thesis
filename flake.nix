{
  description = "Flake for mystmd";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      devShells.${system}.default = pkgs.mkShell {

        buildInputs = with pkgs; [
          act
          imagemagick
          python3
          inkscape
          just
          nodejs
          nodePackages.prettier
          nodePackages_latest.svgo
          rip2
          rsync
          tectonic
          tex-fmt
          typst
          ruff
          svg2pdf
          uv
          wget
          zip
          poppler
        ];

        shellHook = ''
          echo done!
        '';
      };
    };
}
