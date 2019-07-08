{ pkgs }:
let
in
{
 name = "icannabis-shell";

 buildInputs =
 [
  # need node for most things in this repo
  pkgs.nodejs-12_x

  pkgs.clojure
  pkgs.jdk11

 ];

}
