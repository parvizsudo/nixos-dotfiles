{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        #Nix
        jnoortheen.nix-ide

        #Git
        eamodio.gitlens

        #Rust
        rust-lang.rust-analyzer

        #Python
        ms-python.python
      ];

      userSettings = {
        # Appearance
        "editor.fontFamily" = "'JetBrains Mono'";
        "editor.fontSize" = 14;
        "editor.fontLigatures" = true;

        #Editor
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.wordWrap" = "on";
        "editor.smoothScrolling" = true;
        "editor.cursorSmoothCaretAnimation" = "on";

        # Files
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        # Explorer
        "explorer.confirmDelete" = false;

        # Terminal
        "terminal.integrated.scrollback" = 10000;

        # Nix
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";

        # Startup
        "workbench.startupEditor" = "none";
      };
    };
  };

  home.packages = with pkgs; [
    nil
    jetbrains-mono
  ];
}
