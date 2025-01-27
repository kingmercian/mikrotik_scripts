## stop container with tag and print log message
/container stop [find tag="adguard/adguardhome:latest"]
:log info "Adguard container stopped";

## wait while the container status does not equal stopped
:do { :delay 1s } while=([/container get [find tag="adguard/adguardhome:latest"] status ]!="stopped")

## remove container once the status becomes stopped
/container remove [find tag="adguard/adguardhome:latest"]

## wait 10 seconds for old container files to be cleaned. New container extraction fails without this.
:log info "Adguard container removed, waiting 10 seconds for container cleanup";
:delay 10s

## download newest container and run
/container add remote-image=adguard/adguardhome:latest interface=veth1 root-dir=/usb1/containers/adguard-home mounts=adguard-work,adguard-conf dns=1.1.1.1 logging=yes start-on-boot=yes
:log info "Re-adding adguard container";

## wait while container is extracting and status does not equal stopped.
:do { :delay 1s } while=([/container get [find tag="adguard/adguardhome:latest"] status ]!="stopped")

## start container now that extraction is complete and status equals stopped.
/container start [find tag="adguard/adguardhome:latest"]
:log info "Adguard sontainer started";
