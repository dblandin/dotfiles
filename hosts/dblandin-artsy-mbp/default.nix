{
  pkgs,
  inputs,
  self,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.claude-code.overlays.default ];

  environment.systemPackages = [
    pkgs.claude-code
    pkgs.gh
    pkgs.vim
  ];

  programs.zsh.enable = true;

  users.users.devon = {
    name = "devon";
    home = "/Users/devon";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    casks = [
      "bitwarden"
      "brave-browser"
      "caffeine"
      "claude"
      "codex"
      "figma"
      "obsidian"
      "slack"
    ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
    screencapture.location = "~/Pictures/screenshots";
  };

  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = "devon";
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
