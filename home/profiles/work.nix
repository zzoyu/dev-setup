{ lib, pkgs, ... } :
let
  privateEnv = import ~/personal/dev-setup/home/profiles/work.private.nix;
  jenvSource = pkgs.fetchzip {
    url = "https://github.com/jenv/jenv/archive/refs/tags/0.6.0.tar.gz";
    sha256 = "1sxrj0djnhnbfyqkcxyd2i3x8md088zy6pj5rqnbdf29axrhfy84";
  };
in
{
  imports = [ ../macos-aarch64.nix ];

  home.packages = [ pkgs.jdk8 ];

  home.sessionVariables = {
    GIT_AUTHOR = privateEnv.GIT_AUTHOR;
    GIT_EMAIL = privateEnv.GIT_EMAIL;
  };

  programs.zsh.initContent = ''
    export JENV_ROOT="$HOME/.jenv"
    export PATH="$JENV_ROOT/bin:$PATH"
    eval "$(jenv init - zsh)"
  '';

  home.activation.configureJenv = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    JENV_ROOT="$HOME/.jenv"

    mkdir -p "$JENV_ROOT"
    chmod -R u+w "$JENV_ROOT/bin" "$JENV_ROOT/completions" "$JENV_ROOT/libexec" 2>/dev/null || true
    rm -rf "$JENV_ROOT/bin" "$JENV_ROOT/completions" "$JENV_ROOT/libexec"
    cp -R "${jenvSource}/bin" "$JENV_ROOT"
    cp -R "${jenvSource}/completions" "$JENV_ROOT"
    cp -R "${jenvSource}/libexec" "$JENV_ROOT"

    mkdir -p "$JENV_ROOT/versions"
    ln -sfn "${pkgs.jdk8}" "$JENV_ROOT/versions/openjdk8"

    "$JENV_ROOT/bin/jenv" rehash --force
    "$JENV_ROOT/bin/jenv" global openjdk8
  '';
}