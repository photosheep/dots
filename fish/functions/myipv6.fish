function myipv6
    command ip -6 addr | command awk -F' |/' '/global/{print $6}'
end
