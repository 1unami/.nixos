{ pkgs, ... }: {
  imports = [
    ./desktop/plasma5.nix
  ];

  services.tlp.enable = true;
  programs.steam.enable = true; # steam needs to by installed system-wide :(

  environment.systemPackages = with pkgs; [
    gitMinimal
    neovim
    tmux

    nvtop-amd
    htop

    rsync
    curl
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nano.syntaxHighlight = false;
  environment.defaultPackages = [];
}
