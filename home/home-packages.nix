{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.kclock
    spotify
    qbittorrent
    carburetor
    vscodium
    haruna
    telegram-desktop
    obs-studio

  ];
}
