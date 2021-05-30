function websafe
    for imgs in $argv
        set -l farr (string split . $imgs)
        echo Converting $farr[1].$farr[2]
        convert -strip -interlace Plane -sampling-factor 4:2:0 -quality 85% $farr[1].$farr[2] $farr[1]-websafe.$farr[2]
    end
end

