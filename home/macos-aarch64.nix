{ config, pkgs, ... }:
{
  home.sessionVariables = {
    GIT_AUTHOR = "$GIT_AUTHOR";
    GIT_EMAIL = "$GIT_EMAIL";
  };

  home.packages = with pkgs; [
      starship
      git
      fzf
      jq
      bun
      mpv
      yt-dlp
    ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        "copycat" = "cat \"$@\" | pbcopy";
        "untunnel" = "killall -HUP ssh";
        "orderjson" = "cat \"$@\" | jq -S > \"ordered-$@.json\"";
        "bgm" = "mpv \"$@\" --no-video";
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "$GIT_AUTHOR";
          email = "$GIT_EMAIL";
        };
      };
    };

    home-manager = {
      enable = true;
    };
  };
}