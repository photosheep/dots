function myipv4
    command ip -4 addr | command awk -F' |/' '/global/{print $6}'
end
