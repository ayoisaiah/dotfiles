# Create a directory and change to it immediately
function mkcd
    mkdir -p $argv
    cd $argv
end
