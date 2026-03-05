{
  config,
  pkgs,
  battery-notifier,
  ...
}:

{
  imports = [
    # Imports the module that defines the service.battery-notifier option.
    battery-notifier.homeManagerModule.default
  ];

  services.battery-notifier = {
    enable = true;

    settings = {
      interval_ms = 1000;

      icon_path = "/home/zencraftr/.config/dunst/low-battery.png";

      reminder = {
        title = "Low Battery";
        content = "Consider plugging your system into a power outlet.";
        threshold = 20;
      };
      warn = {
        title = "Low Battery";
        content = "Recommended to plug your system into a power outlet.";
        threshold = 15;
      };
      threat = {
        title = "Critical Battery";
        content = "System will shutdown soon unless plugged into a power outlet.";
        threshold = 5;
      };
    };
  };
}
