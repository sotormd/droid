{
  description = "personal nix-on-droid configuration";

  inputs = {

    # nix-on-droid breaks on unstable
    # pin to last working commit instead
    # https://github.com/nix-community/nix-on-droid/issues/495
    nixpkgs-droid = {
      url = "github:nixos/nixpkgs/88d3861";
    };

    # Nix package manager for android
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-droid";
    };

    # my colors & theming
    colors = {
      url = "github:sotormd/colors";
    };

  };

  outputs = inputs: {
    nixOnDroidConfigurations.default = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      extraSpecialArgs = { inherit inputs; };
      pkgs = import inputs.nixpkgs-droid { system = "aarch64-linux"; };
      modules = [ ./module ];
    };
  };
}
