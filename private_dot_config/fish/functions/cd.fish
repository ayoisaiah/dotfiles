# This function can change out of multiple levels of directories at once.
# It expects an integer argument that indicates how many levels to go up
# in the directory tree. If no argument is provided or if the provided argument
# is not a number, it behaves like `cd ..`.
# TODO: Make it so that `cd -` returns to the previous working directory.
function ..
  if string match -qr '^[0-9]+$' $argv[1]
    set n $argv[1]
  else
    set n 1
  end
  for i in (seq $n)
    cd ..
  end
end

