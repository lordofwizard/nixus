{ config, pkgs, ... }:

{
  home.username = "lordofwizard";
  home.homeDirectory = "/home/lordofwizard";

  home.packages = with pkgs; [
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.git = {
    enable = true;
    userName = "lordofwizard";
    userEmail = "lordofwizard@example.com";
  };

  home.stateVersion = "25.05";
}
