{ pkgs, ... }:

{
  home.packages = with pkgs; [
    protonmail-desktop
  ];

  xdg.desktopEntries."proton-mail" = {
    type = "Application";

    name = "Proton Mail";
    genericName = "Email Client";
    comment = "Secure encrypted email client";

    icon = "proton-mail";

    exec = "proton-mail %U";
    terminal = false;

    categories = [
      "Network"
      "Email"
      "Office"
    ];

    mimeType = [
      "x-scheme-handler/mailto"
    ];
  };
}
