{ config, pkgs, ... }:
{
  imports = [
    ../../modules/nixvim
  ];

  home.username = "lordofwizard";
  home.homeDirectory = "/home/lordofwizard";

  home.packages = with pkgs; [
    nnn
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    yq-go
    eza
    fzf
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    nix-output-monitor
    btop
    lm_sensors
    pciutils
    usbutils
  ];

  programs.git = {
    enable = true;
    userName = "lordofwizard";
    userEmail = "advaitpandharpurkar619@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "25.05";
}


