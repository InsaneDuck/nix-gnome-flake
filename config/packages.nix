{lib,config,pkgs,...}:

{
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
         android-tools
         bash-completion
         bun
         cargo
         chiaki
         clippy
         docker
         efibootmgr
         fish
         gcc
         gcolor3
         git
         github-desktop
         gnupg
         godot_4
         gparted
         gradle
         gthumb
         htop
         jdk17
         jetbrains-mono
         jetbrains.idea-ultimate
         kitty
         libappindicator
         libreoffice-fresh
         maven
         mkvtoolnix
         nautilus-open-any-terminal
         neofetch
         neovim
         nix-bash-completions
         nodejs_20
         noto-fonts
         noto-fonts-cjk-sans
         noto-fonts-cjk-serif
         noto-fonts-emoji
         noto-fonts-lgc-plus
         ntfs3g
         openssh
         pigz
         pinentry
         powerline-fonts
         python3
         qbittorrent
         refind
         rpi-imager
         rust-analyzer
         rustc
         rustfmt
         rustycli
         steam
         tree
         vim
         virt-manager
         vlc
         vscode
         wget
         yarn
         yarn-bash-completion
         youtube-dl
      ];
}