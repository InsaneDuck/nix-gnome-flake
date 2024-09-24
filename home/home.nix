{ config, pkgs, ... }:

{
  imports =
  [
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./starship.nix
    ./packages.nix
    ##../gnome/dconf.nix
  ];

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # TODO please change the username & home directory to your own
  home = {
    username = "siva";
    homeDirectory = "/home/siva";
    stateVersion = "23.11";
  };


  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

}