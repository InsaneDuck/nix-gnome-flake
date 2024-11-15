{lib,config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./packages.nix
      ../gnome/gnome.nix
      ../home/steam.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.consoleMode= "max";
    systemd-boot.configurationLimit=5;
    efi.canTouchEfiVariables = true;
  };


  system.autoUpgrade = {
      enable = true;

      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "--no-write-lock-file"
        "-L" # print build logs
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/London";
  };

  # networking
  networking = {
    hostName = "insaneduck-nixos";
    nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    enableIPv6 = false;
    networkmanager.enable = true;
    firewall.allowedTCPPortRanges = [
        { from = 2999; to = 3001; }
        { from = 8000; to = 9000; }
        { from = 1714; to = 1764; }
    ];
  };

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Make sure opengl is enabled
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
    };
  };
  hardware.pulseaudio.enable = false;

  services = {
    xserver ={
        enable = true;
        xkb.layout = "us";
        xkb.variant = "";
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        videoDrivers = ["nvidia"];
    };
    
    avahi = {
        enable = true;
        hostName = "insaneduck-nixos";
        nssmdns4 = true;
        publish = {
          enable = true;
          addresses = true;
          domain = true;
          hinfo = true;
          userServices = true;
          workstation = true;
        };
    };
   
    printing.enable = true;
    
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
    
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
      extraConfig = ''
        DNSOverTLS=yes
      '';
    };
  };

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        powerManagement.enable = lib.mkForce false;
      };
    };
  };

  # sound.enable = true;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.siva = {
    isNormalUser = true;
    description = "Siva";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  virtualisation.libvirtd.enable = true;
  # Allow unfree packages
  nixpkgs.config = {
     allowUnfree = true;
  };

  networking.networkmanager.wifi.powersave=false;

  xdg.mime.defaultApplications = {
    "application/pdf" = "firefox.desktop";
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "video/mp4" = "vlc.desktop";
  };
}
