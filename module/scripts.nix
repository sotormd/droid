{ pkgs, ... }:

let
  switchScript = pkgs.writeShellScriptBin "switch" "nix-on-droid switch --flake github:sotormd/droid";
  cleanScript = pkgs.writeShellScriptBin "clean" "nix-collect-garbage --delete-old";
in
{
  environment.packages = [
    switchScript
    cleanScript
  ];
}
