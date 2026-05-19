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
    taps = [
      "artsy/formulas"
    ];
    brews = [
      "aws-iam-authenticator"
      "hokusai"
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

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

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

  services.aerospace = {
    enable = true;
    settings = {
      gaps = {
        outer.left = 8;
        outer.bottom = 8;
        outer.top = 8;
        outer.right = 8;
        inner.horizontal = 8;
        inner.vertical = 8;
      };

      mode.main.binding = {
        # Focus window
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        # Move window
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # Resize
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        # Layout
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-f = "layout floating tiling";

        # Workspaces
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        # Move window to workspace
        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";

        alt-shift-semicolon = "mode service";
      };

      mode.service.binding = {
        esc = "mode main";
        r = ["flatten-workspace-tree" "mode main"];
        f = ["layout floating tiling" "mode main"];
        backspace = ["close-all-windows-but-current" "mode main"];
        alt-shift-h = ["join-with left" "mode main"];
        alt-shift-j = ["join-with down" "mode main"];
        alt-shift-k = ["join-with up" "mode main"];
        alt-shift-l = ["join-with right" "mode main"];
      };
    };
  };

  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "devon";
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
