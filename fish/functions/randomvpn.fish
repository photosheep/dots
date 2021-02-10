function randomvpn

    # Disconnect from already-connected vpns.
    set -l currentvpns (nmcli c s | awk '/wireguard/ { if($4 != "--"){print $4}}')
    for x in $currentvpns
        nmcli c d $x &> /dev/null
        printf "Disconnected from $x. "
    end

    # Get vpn list, connect to random vpn.
    set -l vpnlist (nmcli c s | awk '/wireguard/ {print $1}')
    set -l choice (random choice $vpnlist)
    nmcli c u $choice &> /dev/null
    printf "Connected to $choice.\n"

end
