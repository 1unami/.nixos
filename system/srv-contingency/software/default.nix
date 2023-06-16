{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gitMinimal
    neovim
    tmux

    htop

    rsync
    curl
    aria
  ];

  services.tailscale.enable = true;
  virtualisation.docker.enable = true;

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nano.syntaxHighlight = false;
  environment.defaultPackages = [];
}
