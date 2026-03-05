{ pkgs, ... }:

{
    # Enabble Bluetooth support.
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;

        settings = {
            General = {
                # Enable A2DP connectivity for newer devices.
                Enable = "Source,Sink,Media,Socket";

                # Show battery charge.
                Experimental = true;
            };
        };
    };

    # Enable remode media player support (MPRIS).
    systemd.user.services.mpris-proxy = {
        description = "Mpris proxy";
        after = [
            "network.target"
            "sound.target"
        ];
        wantedBy = [ "default.target" ];
        serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
}
