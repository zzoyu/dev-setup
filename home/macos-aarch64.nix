{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
      starship
      git
      fzf
      jq
      bun
    ];

  programs = {
    zsh = {
      enable = true;
      initContent = ''
        . "../env.sh"
      '';
      enableCompletion = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        "copycat" = "cat \"$@\" | pbcopy";
        "untunnel" = "killall -HUP ssh";
        "orderjson" = "cat \"$@\" | jq -S > \"ordered-$@.json\"";
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "$PERSONAL_GIT_AUTHOR";
          email = "$PERSONAL_GIT_EMAIL";
        };
      };
    };

    home-manager = {
      enable = true;
    };
  };
}