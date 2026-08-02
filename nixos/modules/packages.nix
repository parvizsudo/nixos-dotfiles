{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Install throne
  programs.throne.enable = true;
  programs.throne.tunMode.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # kde connect
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [

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

    # Coding stuff
    gnumake
    gcc
    python3
    uv
    rustup

    # CLI utils
    fastfetch
    tree
    wget
    git
    btop
    unzip
    ffmpeg
    yt-dlp
    lazygit
    gh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    vazir-fonts
  ];
}
