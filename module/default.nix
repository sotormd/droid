{ inputs, ... }:

{
  imports = [
    # nixos modules
    inputs.colors.nixosModules.colors

    # MODULES - sorted alphabetically

    # terminal colors
    ./colors.nix

    # nix package manager
    ./nix.nix

    # packages
    ./packages.nix

    # switch & purge
    ./scripts.nix
  ];

  environment = {

    etcBackupExtension = ".bak";

    sessionVariables = {
      NIXOS_ROLE = "droid";
      PS1 = ''\n\[\033[1;32m\][\w] λ\[\033[0m\] '';
    };

    motd = ''
      nix-on-droid
    '';

  };

  system.stateVersion = "24.05";
}
