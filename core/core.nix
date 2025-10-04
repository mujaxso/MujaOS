{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./nix.nix
    ./users.nix
    # shells
    ./shells/zsh/zsh.nix
    
  ];

}
