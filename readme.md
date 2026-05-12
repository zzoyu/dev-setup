# 개발 환경 세팅 레포

이것저것 관리 및 보관
dotfiles, flakes, some miscellaneous items etc.

## Nix Flake Setting

### personal

```zsh
nix --extra-experimental-features 'nix-command flakes' run github:nix-community/home-manager -- switch --flake .#personal
```

### work (based on personal configuration)

```zsh
nix --extra-experimental-features 'nix-command flakes' run github:nix-community/home-manager -- switch --flake .#work
```

## Home Lab Architecture

![Architecture](architecture.svg)
