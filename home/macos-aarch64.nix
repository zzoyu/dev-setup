{ config, pkgs, ... }:
let
  gitAuthor = "${config.home.sessionVariables.GIT_AUTHOR}";
  gitEmail = "${config.home.sessionVariables.GIT_EMAIL}";

in
{
  home.packages = with pkgs; [
      starship
      git
      fzf
      jq
      bun
      uv
      mpv
      yt-dlp
    ];
  
  home.homeDirectory = "/Users/${config.home.username}";

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh.enable = true;
      shellAliases = {
        "nix-work" = "home-manager switch --flake .#work --impure";
        "nix-personal" = "home-manager switch --flake .#personal --impure";
        "copycat" = "cat \"$@\" | pbcopy";
        "untunnel" = "killall -HUP ssh";
        "orderjson" = "cat \"$@\" | jq -S > \"ordered-$@.json\"";
        "bgm" = "mpv \"$@\" --no-video";
      };
    };
    starship = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        vim-nix
        vim-fugitive
        vim-rhubarb
        vim-gitgutter
        vim-sleuth
      ];
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "${gitAuthor}";
          email = "${gitEmail}";
        };
      };
    };

    home-manager = {
      enable = true;
    };

    gemini-cli = {
      enable = true;
    };
  };
}