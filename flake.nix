{
    description = "A flake for building Hello world";
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
    outputs = {self, nixpkgs} : {
      defaultPackage.x86_64-linux = 
          with import nixpkgs {system = "x86_64-linux";};
          stdenv.mkDerivation {
              name = "hello";
              src  = self;
              buildPhase = "gcc -o hello ./hello.c";
              installPhase = "mkdir -p $out/bin; install -t $out/bin hello";

          };

    };
}
