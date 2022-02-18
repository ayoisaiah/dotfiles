function vman --wraps man --description 'use nvim for displaying man pages'
  man $argv | col -bp | iconv -c | nvim -u NONE -R -c 'set ft=man nomod nolist' -;
end
