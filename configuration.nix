{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    vim
    btop
    pfetch
  ];

  users.users.lordofwizard = {
    isNormalUser = true;
    description = "lordofwizard";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
    ];
  };

  # security.sudo.wheelNeedsPassword = false; 

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };

  system.stateVersion = "25.05";
}
