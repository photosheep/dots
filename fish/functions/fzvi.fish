function fzvi
    set -l fdarg
    for argz in $argv
        set fdarg "$argz,$fdarg"
    end
    set files (fd --extension={(echo $fdarg)} | fzf -m)
    if test "$files" != ""
        command nvim -p $files
    end
end
