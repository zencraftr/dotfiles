{ pkgs, ... }:
{
  # Hyprpaper
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2;

      preload = [ "/home/zencraftr/Downloads/bh.png" ];

      wallpaper = [ "/home/zencraftr/Downloads/bh.png" ];
    };
  };
}
