function mping --description 'Ping multiple hosts.'
    for ip in $argv
        echo "$ip -" (ping -c5 $ip | sed -En 's/.*time=//g;2,6p')
    end
end
