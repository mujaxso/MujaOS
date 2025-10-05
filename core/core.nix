{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./nix.nix
    ./users.nix
    ./git.nix
    # shells
    ./shells/shells.nix
    
  ];

}
