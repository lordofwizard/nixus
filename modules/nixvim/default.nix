{ config, lib, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      termguicolors = true;
      cursorline = true;
      scrolloff = 8;
      signcolumn = "yes";
      swapfile = false;
      backup = false;
      mouse = "a";
      clipboard = "unnamedplus";
      showtabline = 2;
    };
    plugins = {
      fzf-lua.enable = true;
#      presence-nvim.enable = true;
    };
    globals.mapleader = " ";
  };
}


