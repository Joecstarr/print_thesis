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
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [
          pkgs.alegreya-sans
        ];
      };
    in
    {

      devShells.${system}.default = pkgs.mkShell {

        buildInputs = with pkgs; [
          imagemagick
          inkscape
          just
          nodePackages_latest.svgo
          rip2
          tectonic
          tex-fmt
          svg2pdf
          poppler
        ];

        shellHook = ''
          export FONTCONFIG_FILE="${fontsConf}"
          echo done!
        '';
      };
    };
}
