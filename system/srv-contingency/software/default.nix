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
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };
  virtualisation.docker.enable = true;

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.nano.syntaxHighlight = false;
  environment.defaultPackages = [];
}
