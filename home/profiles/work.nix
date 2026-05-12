{ ... } :
let
  privateEnv = import ~/personal/dev-setup/home/profiles/work.private.nix;
in
{
  imports = [ ../macos-aarch64.nix ];

  home.sessionVariables = {
    GIT_AUTHOR = privateEnv.GIT_AUTHOR;
    GIT_EMAIL = privateEnv.GIT_EMAIL;
  };
}