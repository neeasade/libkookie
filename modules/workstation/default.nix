/* GENERAL WORKSTATION CONFIGURATION
 *
 * A workstation is a computer with it's own screen,
 * keyboard and (sometimes) mouse. It can also sometimes
 * play music or print (provided the correct satanic
 * sacrifice was precured first).
 *
 * Some of the modules included by this file depend on
 * root access on a system (nixos-rebuild), while some
 * can be operated entirely in userspace.
 */

{ pkgs, home-manager, ... }:

{
  home-manager.users.spacekookie = { ... }: {
    imports = [
      ./chat
      ./devel
      ./emacs
      ./git
      ./pass
    ];
  };
  
  imports = [
    ./graphics
    ./hardware
    ./mail
    ./networking
    ./sound
    ./syncthing
  ];
}
