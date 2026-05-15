# Per - user configuration managed by home - manager.
# These settings only apply to the "devon" user.
{ config, pkgs, ... }:
{
  # Required by home - manager to locate and set up the user's environment
  home.username = "devon";
  home.homeDirectory = "/Users/devon";

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    pkgs.nixfmt
  ];

  # mise is a runtime version manager(replaces nvm, pyenv, rbenv, etc.).
  # enabling it installs the binary and wires up shell integration automatically.
  programs.mise = {
    enable = true;
    # Injects`eval "$(mise activate zsh)"` into the user's zsh config
    enableZshIntegration = true;
    # Optionally declare global tools declaratively:
    # globalConfig = {
    #   tools = {
    #     node = "lts";
    #     python = "3.12";
    #   };
    # };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        anthropic.claude-code
        graphql.vscode-graphql-syntax
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        vscodevim.vim
      ];
      userSettings = {
        "editor.formatOnSave" = true;
        "vim.enable" = true;
        "vim.statusBarColorControl" = true;
        "vim.enableNeovim" = false;
      };
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      darwin-switch = "sudo darwin-rebuild switch --flake ~/dotfiles#dblandin-artsy-mbp";
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
