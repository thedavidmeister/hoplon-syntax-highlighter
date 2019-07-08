let
 nix-shell-release-tag = "master";
 nix-shell-release-sha256 = "16inglqqph2kxh30n7jc6gziyiiwbfx7qsqd17j08dnjmz4bpf4h";

 nix-shell = import (fetchTarball {
  url = "https://github.com/thedavidmeister/nix-shadow-cljs/tarball/${nix-shell-release-tag}";
  sha256 = "${nix-shell-release-sha256}";
 });
 # holonix = import ../holonix;
in
with nix-shell.pkgs;
{
 core-shell = stdenv.mkDerivation (nix-shell.shell // {
  name = "core-shell";

  buildInputs = []
   ++ nix-shell.shell.buildInputs
  ;
 });
}
