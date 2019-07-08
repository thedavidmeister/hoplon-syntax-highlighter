let
 pkgs = import ./nixpkgs;

 shell = pkgs.callPackage ./nix-shell { pkgs = pkgs; };

 # functions cannot be handled by mkDerivation
 derivation-safe-shell = (removeAttrs shell ["override" "overrideDerivation" "npx-bin"]);
in
{
 main = pkgs.stdenv.mkDerivation (derivation-safe-shell // {
   buildInputs = []
   ++ derivation-safe-shell.buildInputs

   ++ (pkgs.callPackage ./flush {
     serve = import ./serve/config.nix;
   }).buildInputs

   ++ (pkgs.callPackage ./serve { }).buildInputs

   ++ (pkgs.callPackage ./shadow-cljs { }).buildInputs
   ;

   shellHook = ''
   npm install
   '';

 });
}
