{ pkgs, ... }:

let
  flakeDir = "~/nix";
in
{
  programs.fish = {
    enable = true;

    shellAliases = {

      ll = "ls -la";
      v = "vscodium";
      se = "sudoedit";
      ff = "fastfetch";
    };

    functions = {
      backup = ''
        set timestamp (date +%Y%m%d_%H%M%S)
        cp -r $argv[1] "$argv[1].bak.$timestamp"
        echo "✅ Backup: $argv[1].bak.$timestamp"
      '';

      copy = ''
        if test (count $argv) -eq 2; and test -d $argv[1]
            command cp -r $argv[1] $argv[2]
        else
            command cp $argv
        end
      '';

      extract = ''
        if not test -f $argv[1]
            echo "❌ File not found: $argv[1]"
            return 1
        end
        switch $argv[1]
            case '*.tar.bz2'; tar xjf $argv[1]
            case '*.tar.gz';  tar xzf $argv[1]
            case '*.tar.xz';  tar xJf $argv[1]
            case '*.tar.zst'; tar --zstd -xf $argv[1]
            case '*.tar';     tar xf  $argv[1]
            case '*.bz2';     bunzip2 $argv[1]
            case '*.gz';      gunzip  $argv[1]
            case '*.zip';     unzip   $argv[1]
            case '*.rar';     unrar x $argv[1]
            case '*.7z';      7z x    $argv[1]
            case '*.zst';     unzstd  $argv[1]
            case '*'
                echo "❓ Unknown format: $argv[1]"
                return 1
        end
        echo "✅ Extracted: $argv[1]"
      '';

      gclone = ''
        git clone $argv[1] && cd (basename $argv[1] .git)
      '';

      ginit = ''
        git init
        git add .
        git commit -m "🎉 Initial commit"
      '';

      mkcd = ''
        mkdir -p $argv[1] && cd $argv[1]
      '';

      history = ''
        builtin history --show-time='%F %T ' $argv
      '';
    };

    interactiveShellInit = ''
      set -g fish_greeting
      set -g __done_min_cmd_duration 10000
      set -g __done_notification_urgency_level low
    '';

    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
