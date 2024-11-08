{lib,config,pkgs,...}:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
         gnome-builder
         dconf-editor
         gnome-boxes
         gnome-chess
         gnome-tweaks
         sushi
         gnomeExtensions.clipboard-indicator
         gnomeExtensions.dash-to-panel
         gnomeExtensions.gsconnect
         gnomeExtensions.unite
         #gnomeExtensions.applications-menu
    ];

    environment.gnome.excludePackages = (with pkgs; [
        gnome-shell-extensions
    ]);
}