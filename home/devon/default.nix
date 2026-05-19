# Per - user configuration managed by home - manager.
# These settings only apply to the "devon" user.
{ config, pkgs, ... }:
{
  # Required by home - manager to locate and set up the user's environment
  home.username = "devon";
  home.homeDirectory = "/Users/devon";

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    unstable.awscli2
    biome
    nixfmt
    tree
    watchman
  ];

  programs.mise = {
    enable = true;
    enableZshIntegration = true;

    globalConfig = {
      tools = {
        kubectl = "1.22.17";
        node = "22";
        python = "3.13";
        ruby = "3.4";
      };

      settings = {
        experimental = true;
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        anthropic.claude-code
        bbenoist.nix
        biomejs.biome
        graphql.vscode-graphql-syntax
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        vscodevim.vim
      ];
      userSettings = {
        "editor.formatOnSave" = true;
        "vim.statusBarColorControl" = true;
        "vim.enableNeovim" = false;
        "json.schemaDownload.trustedDomains" = {
          "https://biomejs.dev" = true;
        };
      };
    };
  };

  programs.gh.enable = true;

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      darwin-switch = "sudo darwin-rebuild switch --flake ~/dotfiles#dblandin-artsy-mbp";
    };
    sessionVariables = {
      RUBY_CONFIGURE_OPTS = "--disable-install-rdoc";
    };

    # Disable zsh native history - atuin handles history instead
    history = {
      size = 0;
      save = 0;
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      filter_mode = "host";
      # ... other atuin settings
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Devon Blandin";
        email = "123595+dblandin@users.noreply.github.com";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # home - manager release version — controls default values for options
  # that change over time.Don't change this unless you've read the changelog.
  home.stateVersion = "25.11";
}
