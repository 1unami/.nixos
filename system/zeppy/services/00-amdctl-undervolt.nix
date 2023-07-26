{ ... }: {
  # pstate #0 undervolt [1218mv -> 1168mv]
  systemd.services.s00-amdctl-undervolt = {
    script = ''
      amdctl -m -p0 -v61
    '';
    wantedBy = [ "multi-user.target" ];
  };
};
