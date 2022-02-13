function vman --wraps man --description 'use vim / nvim for displaying man pages'
  # col `-b` flag = don't output any backspaces
  # col `-p` flag = force uknown control sequences
  # ===
  # iconv -convert between character encodings
  # ==
  # iconv `-c` flag = characters that can't be converter are
  # ...silently discarded
  # ===
  # nvim `-c` flag = run argument / command after executing nvim
  # nvim `-R` flag = open "file" in read-only mode
  # ===
  # NOTE: not loading `.vimrc` won't work because i want some bells and whistles provided by my `.vimrc`, ie. syntax highlighting.
  man $argv | col -bp | iconv -c | nvim -u NONE -c 'set ft=man nomod nolist' -;
end
