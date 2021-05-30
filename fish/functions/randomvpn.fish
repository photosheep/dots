function randomvpn

    # Get old VPN to replace with a new, random one.
    set -l oldvpns (nmcli c s | awk '/wireguard/ { if($4 != "--"){print $4}}')

    # Get vpn list, connect to random unconnected VPN.
    set -l vpnlist (nmcli c s | awk '/wireguard/ && /--/ {print $1}')
    set -l choice (random choice $vpnlist)
    nmcli c u $choice &> /dev/null

    # Disconnect from previous VPN instances.
    # Doing this after connect should limit IP leak.
    set -l vpns
    for x in $oldvpns
        nmcli c d $x &> /dev/null
        set -a vpns "$x"
    end

    set choice (set_color -o brgreen;echo -n $choice;set_color normal)
    set vpns (set_color -o magenta;echo -n $vpns;set_color normal)

    echo "Connected to $choice and disconnected from [$vpns]."

end
