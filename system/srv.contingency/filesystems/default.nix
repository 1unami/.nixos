{
  fileSystems."/vol/linear0".options = [ "noatime" "nodiratime" "discard" "defaults" ];

  fileSystems."/".options = [ "compress=zstd:2" "space_cache=v2" "discard=async" "commit=60" "noatime" "ssd" ];
  fileSystems."/home".options = [ "compress=zstd:2" "space_cache=v2" "discard=async" "commit=60" "noatime" "ssd" ];
  fileSystems."/nix".options = [ "compress=zstd:2" "space_cache=v2" "discard=async" "commit=60" "noatime" "ssd" ];
}
