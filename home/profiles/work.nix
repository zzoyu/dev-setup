{ ... } :
let
  privateEnv = import ./work.private.nix;
in
{
  imports = [ ../macos-aarch64.nix ];

  home.sessionVariables = privateEnv.home.sessionVariables;
}