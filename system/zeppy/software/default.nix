{ pkgs, ... }: {
  imports = [
    ./desktop/plasma5.nix
  ];

  environment.systemPackages = with pkgs; [
    git
  ];
}
