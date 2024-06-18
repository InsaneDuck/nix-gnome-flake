{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # here is some command line tools I use frequently
        # feel free to add your own or remove some of them

        neofetch
        nnn # terminal file manager

        # archives
        zip
        xz
        unzip
        p7zip

        # system tools
        sysstat
        lm_sensors # for `sensors` command
        ethtool
        pciutils # lspci
        usbutils # lsusb
    ];
}