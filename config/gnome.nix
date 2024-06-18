{lib,config,pkgs,...}:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
         gnome-builder
         gnome.dconf-editor
         gnome.gnome-boxes
         gnome.gnome-chess
         gnome.gnome-tweaks
         gnome.sushi
         gnomeExtensions.clipboard-indicator
         gnomeExtensions.dash-to-panel
         gnomeExtensions.gsconnect
         gnomeExtensions.unite
      ];
}