#!/usr/bin/env fish

set -U grc_plugin_execs acpi cat cvs df diff dig gcc g++ ifconfig \
       make mount mtr netstat ping ps tail traceroute \
       wdiff blkid du dnf docker docker-machine env id ip iostat \
       last lsattr lsblk lspci lsmod lsof lsusb getfacl getsebool ulimit uptime nmap \
       fdisk findmnt free semanage sar ss sysctl systemctl stat showmount \
       tcpdump tune2fs vmstat w who

for executable in $grc_plugin_execs
    if type -q $executable
        function $executable --inherit-variable executable --wraps=$executable
                grc $executable $argv
        end
    end
end
