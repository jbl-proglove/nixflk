{ lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;

  name = "Noah Blank";
in
{
  imports = [ ../../profiles/develop ./graphical ];

  home-manager.users.noah = {
    imports = [ ../profiles/git ../profiles/alacritty ../profiles/direnv ];
  };

  users.users.noah = {
    uid = 1000;
    description = name;
    hashedPassword = fileContents ../../secrets/noah;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
