{
  pkgs,
  inputs,
  self,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.claude-code.overlays.default ];

  environment.systemPackages = with pkgs; [
    claude-code
    unstable.colima
    docker
    gh
    poppler-utils
    vim
  ];

  programs.zsh.enable = true;

  users.users.devon = {
    name = "devon";
    home = "/Users/devon";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    brews = [
      "libyaml"
    ];
    casks = [
      "1password"
      "alfred"
      "bitwarden"
      "brainfm"
      "brave-browser"
      "caffeine"
      "chatgpt"
      "claude"
      "codex"
      "figma"
      "ghostty"
      "granola"
      "insta360-link-controller"
      "jabra-direct"
      "loom"
      "notion"
      "nordvpn"
      "obsidian"
      "qobuz"
      "signal"
      "slack"
      "tailscale-app"
      "todoist-app"
      "tunnelblick"
      "veracrypt-fuse-t"
      "vlc"
      "whatsapp"
      "zwift"
    ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      show-recents = false; # Hide recent apps in dock
      tilesize = 40; # Icon size
      persistent-apps = [ ]; # Clear default dock apps
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv"; # List view
      ShowPathbar = true; # Show path at bottom
      ShowStatusBar = true; # Show file count at bottom
      _FXShowPosixPathInTitle = true; # Show full path in title
      FXDefaultSearchScope = "SCcf"; # Search current folder by default
    };

    screencapture.location = "~/Pictures/screenshots";

    # Keyboard & Input
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15; # Faster key repeat (default 15, 10-120)
      KeyRepeat = 2; # Repeat speed (default 2, 1-120)
      AppleKeyboardUIMode = 3; # Full keyboard access
    };

    # Trackpad
    trackpad = {
      Clicking = true; # Tap to click
      TrackpadThreeFingerDrag = true; # Three finger drag
    };

    # General
    ".GlobalPreferences" = {
      "com.apple.mouse.scaling" = 2.0;
    };

    # Disable spelling autocorrect
    NSGlobalDomain."NSAutomaticSpellingCorrectionEnabled" = false;
  };

  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "devon";
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
