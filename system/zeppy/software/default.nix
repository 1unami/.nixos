{ pkgs, ... }: {
  imports = [
    ./desktop/plasma5.nix
  ];

  #services.tlp.enable = true;
  programs.steam.enable = true; # steam needs to by installed system-wide :(
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    gitMinimal
    neovim
    tmux

    nvtop-amd
    htop

    rsync
    curl

    python3Minimal
    pipenv
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nano.syntaxHighlight = false;
  environment.defaultPackages = [];
}
