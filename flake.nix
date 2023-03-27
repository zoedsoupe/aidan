{
  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";

      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells."${system}".default = with pkgs; mkShell {
        name = "aidan";
        packages = [ elixir_1_14 ];
      };

      packages."${system}" = rec {
        default = aidan;

        aidan =
          let
            inherit (pkgs) beam;
            inherit (beam.interpreters) erlang;

            beamPackages = beam.packagesWith erlang;
            name = "aidan";
            version = "0.1.0";
            src = ./.;
          in
          beamPackages.buildMix {
            inherit src name version;

            sha256 = "";
          };
      };
    };
}
