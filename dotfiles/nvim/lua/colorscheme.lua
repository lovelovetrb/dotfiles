vim.cmd [[
try
  colorscheme iceberg
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
    highlight LineNr ctermbg=none guibg=none
    highlight Folded ctermbg=none guibg=none
    highlight EndOfBuffer ctermbg=none guibg=none
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
