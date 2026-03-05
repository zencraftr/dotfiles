{ ... }:

{
    programs.firefox = {
        enable = true;
    };

    # Desktop entry
    xdg.desktopEntries."firefox" = {
        type = "Application";

        name = "Firefox";
        genericName = "Web Browser";
        comment = "The Mozilla Firefox Web Browser";
        icon = "firefox";

        exec = "firefox %U";
        terminal = false;

        actions = {
            newWindow = {
                name = "New Window";
                exec = "firefox --new-window %U";
            };
            newPrivateWindow = {
                name = "New Private Window";
                exec = "firefox --private-window %U";
            };
        };

        categories = [
            "Application"
            "Network"
            "WebBrowser"
        ];
        mimeType = [
            "text/html"
            "text/xml"
        ];
    };
}
