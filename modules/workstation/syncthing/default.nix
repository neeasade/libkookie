{ pkgs, ... }: {
  services.syncthing = {
    enable = true;
    dataDir = "/home/.local/syncthing/";
    user = "spacekookie";
    group = "spacekookie";
    openDefaultPorts = false;
    guiAddress = "localhost:1234";
  };
}
