{
  ## networking
  networking.hostName = "zeppy";
  networking.networkmanager.enable = true;

  ## time
  time.timeZone = "Europe/Warsaw";

  ## console
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  #  keyMap = "us";
  #  useXkbConfig = true; # use xkbOptions in tty.
  };

  ## firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;
}
