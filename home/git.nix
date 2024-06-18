{ config, pkgs, ... }:

{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Siva";
    userEmail = "39309626+InsaneDuck@users.noreply.github.com";
  };
}