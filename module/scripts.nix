{ pkgs, ... }:

let
  switchScript = pkgs.writeShellScriptBin "switch" "";

  cleanScript = pkgs.writeShellScriptBin "clean" ''
    #!${pkgs.runtimeShell}

        nix-collect-garbage --delete-old
  '';
in
{
  environment.packages = [
    switchScript
    cleanScript
  ];
}
