local present, base16 = pcall(require, 'base16')

if present then
  local hardcore = base16.theme_from_array {
    "1b1f27"; "1e222a"; "30343c"; "4A4A4A";
    "42464e"; "cdcdcd"; "e5e5e5"; "ffffff";
    "fb4934"; "fd971f"; "e6db74"; "a6e22e";
    "708387"; "66d9ef"; "9e6ffe"; "e8b882";
  }
  base16(hardcore, true)
  return true
else
  return false
end
