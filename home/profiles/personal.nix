{ ... } :
{
  imports = [ ../macos-aarch64.nix ];

  home.sessionVariables = {
    GIT_AUTHOR = "Yujin";
    GIT_EMAIL = "zzoyu@hotmail.com";
  };
}