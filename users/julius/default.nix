{ lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;

  name = "Julius Blank";
in
{
  imports = [ ../../profiles/develop ./graphical ];

  home-manager.users.julius = {
    imports = [ ../profiles/git ../profiles/alacritty ../profiles/direnv ];
  };

  users.users.julius = {
    uid = 1011;
    description = name;
    hashedPassword = fileContents ../../secrets/julius;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
