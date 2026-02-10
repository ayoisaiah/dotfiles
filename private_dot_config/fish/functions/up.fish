function up --description "Go up a number of directories"
    set -l d ""
    if test (count $argv) -gt 0
        for i in (seq $argv[1])
            set d $d"../"
        end
    else
        set d "../"
    end
    cd $d
end
