# 개발 환경 세팅 레포

Nix를 경험해보고 싶어서 시작한 레포입니다. 이것저것 개발 환경설정 관리 및 보관.
dotfiles, flakes, some miscellaneous items etc.

## Nix Flake Setting

### profile 적용

personal profile 적용 기준.

```zsh
home-manager switch --flake .#personal --impure
```

## Home Lab Architecture

![Architecture](architecture.svg)
