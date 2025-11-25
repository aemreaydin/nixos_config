{ inputs, ... }:
{
  nixpkgs.overlays = [
    # Nix User Repository
    inputs.nur.overlays.default
  ];
}
