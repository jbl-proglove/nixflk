{ lib, modulesPath, pkgs, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../profiles/graphical
    ../profiles/laptop
    ../profiles/misc/disable-mitigations.nix
#    ../profiles/network/torrent.nix
#    ../profiles/graphical/games
#    ../profiles/virt
     ../users/noah
     ../users/julius
  ];

#  environment.systemPackages = [ pkgs.system76-firmware ];

#  boot.initrd.availableKernelModules =
#    [ "xhci_pci" "ahci" "nvme" "sd_mod" "sdhci_pci" ];
#  boot.initrd.kernelModules = [ "dm-snapshot" ];
#  boot.kernelModules = [ "kvm-intel" ];
#  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

#  boot.loader.grub = {
#    enable = true;
#    version = 2;
#    device = "nodev";
#    efiSupport = true;
#    enableCryptodisk = true;
#  };

#  boot.loader.efi.efiSysMountPoint = "/boot/efi";
#  boot.initrd.luks.devices = {
#    root = {
#      device = "/dev/disk/by-uuid/aed36f15-3b54-49fa-bd18-75ecc73ef5c9";
#      keyFile = "/luks.keyfile";
#      fallbackToPassword = true;
#      preLVM = true;
#    };
#  };

#  hardware.opengl.extraPackages = with pkgs; [
#    vaapiVdpau
#    libvdpau-va-gl
#  ];

#  boot.initrd.secrets = { "/luks.keyfile" = ../secrets/luks.keyfile; };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1bf3d4d0-f61c-4dde-989f-a768f75bc585";
#    fsType = "xfs";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/AC1C-3D62";
    fsType = "vfat";
  };

#  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;

#  nix.maxJobs = lib.mkDefault 16;

#  services.xserver.videoDrivers = [ "nvidia" ];

#  services.fstrim.enable = true;

#  services.xserver.windowManager.steam.extraSessionCommands = ''
#    if ! xrandr | grep HDMI-0 | grep disconnected > /dev/null; then
#      xrandr --output DP-0 --off
#    fi
#  '';

  services.picom = {
    backend = "glx";
    vSync = true;
  };

  security.mitigations.acceptRisk = true;

#  hardware.nvidia.modesetting.enable = true;
#  hardware.cpu.intel.updateMicrocode = true;
#  hardware.system76.enableAll = true;
}
